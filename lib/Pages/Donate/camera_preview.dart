import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture = Future.value();
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    _controller =
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);

    await _controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      //to refresh widget
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _takePicture() async {
    try {
      final XFile picture = await _controller.takePicture();

      print('Picture taken at ${picture.path}');
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        print('Picked image from gallery: ${pickedImage.path}');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            if (_controller.value.isInitialized) {
              return Stack(
                children: [
                  CameraPreview(_controller),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            onPressed: _takePicture,
                            child: const Icon(Icons.camera),
                          ),
                          FloatingActionButton(
                            onPressed: _pickImage,
                            child: const Icon(Icons.image),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              // _controller is not initialized yet
              return Center(child: CircularProgressIndicator());
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
