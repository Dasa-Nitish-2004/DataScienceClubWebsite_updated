import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  String path;
  ImageScreen({super.key, required this.path});
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String imageUrl = "";

  @override
  void initState() {
    _loadImage();
    super.initState();
  }

  Future<void> _loadImage() async {
    try {
      // Get Firebase Storage instance
      FirebaseStorage storage = FirebaseStorage.instance;

      // Get image URL from Firebase Storage dynamically
      String downloadURL = await storage.ref(widget.path).getDownloadURL();

      setState(() {
        imageUrl = downloadURL;
      });
    } catch (e) {
      print("Error loading image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return imageUrl == ""
        ? Image(image: NetworkImage(imageUrl))
        : Image.asset("assets/images/c3.jpeg");
  }
}
