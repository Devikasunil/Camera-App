import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  String firstButtonText = 'Take photo';

  String albumName = 'cameraApp';

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

File? imageFile;

class _ScreenHomeState extends State<ScreenHome> {
  set image(File image) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Take a photo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.only(bottom: 90),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.deepPurpleAccent),
                  child: Text(
                    '''Click the button below to take the picture and download''',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Card(
                    shape: CircleBorder(),
                    margin: EdgeInsets.only(top: 40, left: 150),
                    child: FloatingActionButton(
                      onPressed: () => _takephoto(),
                      child: Icon(
                        Icons.photo_camera,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _takephoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    setState(() {
      this.image = imageTemporary;
    });
    GallerySaver.saveImage(image.path);
  }
}
