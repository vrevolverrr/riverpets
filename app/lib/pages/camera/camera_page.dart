import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpets/camera_service.dart';
import 'package:riverpets/data/global.dart';
import 'package:riverpets/main.dart';
import 'package:riverpets/services/image_recognition.dart';
import 'package:riverpets/services/rp_wallet.dart';

class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: <Widget>[
        CameraPreview(controller),
        Positioned(
          bottom: 50.0,
          left: 165.0,
          child: GestureDetector(
            onTap: () => {
              controller.takePicture().then((file) async {
                recogniseRiverImage(file.path).then((r) {
                  if (r <= 0.7) {
                    GetIt.instance.get<GlobalState>().shouldSnack = true;
                    // GetIt.instance.get<VCInstance>().mintToken();
                  }
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => const PetApp()),
                      (route) => false);
                });
              })
            },
            child: Container(
              width: 80.0,
              height: 80.0,
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
              child: const Icon(Icons.camera_alt),
            ),
          ),
        )
      ],
    );
  }
}
