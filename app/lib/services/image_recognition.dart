import 'dart:convert';

import 'package:http/http.dart' as http;

Future<double> recogniseRiverImage(String path) async {
  Uri url = Uri.http("10.91.44.0:1231", "predict");
  var request = http.MultipartRequest("POST", url);

  request.files.add(await http.MultipartFile.fromPath("file", path));

  try {
    // Send the request
    var response = await request.send();

    // Check the response
    if (response.statusCode == 200) {
      var res = await http.Response.fromStream(response);
      return (jsonDecode(res.body)["prediction"] as int).toDouble();
    }
  } catch (e) {
    print('Error: $e');
  }

  return -1;
}
