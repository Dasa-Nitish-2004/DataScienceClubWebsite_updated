import 'package:flutter/material.dart';

class Img extends StatefulWidget {
  String path;
  double height, width;
  Img({Key? key, required this.path, required this.height, required this.width})
      : super(key: key);

  @override
  _ImgState createState() => _ImgState();
}

class _ImgState extends State<Img> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        height: isHovered ? widget.height + 20 : widget.height,
        width: widget.width == 0 ? double.infinity : widget.width,
        duration: Duration(milliseconds: 300), // Faster animation
        curve: Curves.easeInOut, // Smooth transition effect
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.path),
            fit: BoxFit.cover, // Ensures the image fits well
          ),
          borderRadius:
              BorderRadius.circular(12), // Adds a subtle rounding effect
          boxShadow: isHovered
              ? [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 10, spreadRadius: 2)
                ]
              : [
                  BoxShadow(color: Colors.black12, blurRadius: 5)
                ], // Slight shadow effect on hover
        ),
      ),
    );
  }
}
