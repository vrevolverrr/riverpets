from flask import Flask, jsonify, request
from werkzeug.utils import secure_filename
from flask_cors import CORS
import os
from tensorflow.keras.models import load_model
from PIL import Image
import numpy as np

# Define allowed file types
ALLOWED_EXTENSIONS = set(['png', 'jpeg', 'jpg'])

# Define upload folder
UPLOAD_FOLDER = os.path.abspath(os.path.join(os.path.dirname(__file__), 'Downloads'))
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

# Create Flask app
app = Flask(__name__)
CORS(app)  # Allow cross-origin resource sharing
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 500 * 1000 * 1000  # 500 MB

# Load the image classification model
model = load_model('ownModel_Tuned1_no_lr_schedule.h5')

# Define image size for the model
img_width, img_height = 131, 131

# Function to check if file extension is allowed
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/')
def home():
    return 'Welcome to the combined upload and image prediction API!'

# Combined upload and prediction endpoint
@app.route('/predict', methods=['POST'])
def upload_and_predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400
    
    if allowed_file(file.filename):
        try:
            # Save the file
            filename = secure_filename(file.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(file_path)

            # Load and preprocess the image for the model
            img = Image.open(file.stream).convert('RGB')
            img = img.resize((img_width, img_height))
            img_array = np.array(img)
            img_array = np.expand_dims(img_array, axis=0)  # Add batch dimension

            # Make predictions
            predictions = model.predict(img_array)
            predicted_class = np.argmax(predictions[0])

            return jsonify({
                'status': 'success',
                'uploaded_file': filename,
                'prediction': int(predicted_class)
            }), 200
        except Exception as e:
            return jsonify({'error': str(e)}), 500
    else:
        return jsonify({'error': 'File type not allowed'}), 400

if __name__ == '__main__':
    app.run(debug=True)
