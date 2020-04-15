import 'dart:async';
import 'dart:developer' as developer;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

///
/// Screen for displaying the output of the camera
/// and taking a picture.
///
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({Key key, @required this.camera}) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController controller;
  Future<void> initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.max);
    initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ClipRect(
              child: Container(
                child: Transform.scale(
                  scale: controller.value.aspectRatio / size.aspectRatio,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: CameraPreview(controller),
                    ),
                  ),
                ),
              ),
            );
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await initializeControllerFuture;
            final imgPath = join(
              (await getApplicationDocumentsDirectory()).path,
              '${DateTime.now()
                  .toString()
                  .replaceAll(" ", "-")
                  .replaceAll("-", "_")
                  .replaceAll(".", "_")
                  .replaceAll(":", "_")}.png',
            );
            developer.log("Attempting to take picture at path: $imgPath");
            await controller.takePicture(imgPath);
            developer.log("Made picture at path: $imgPath");
            Navigator.pop(context, imgPath);
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
