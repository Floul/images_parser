import 'package:flutter/material.dart';
import 'package:images_parser/models/image_model.dart';

class ImageFullScreen extends StatefulWidget {
  final ImageModel image;

  ImageFullScreen({this.image});

  @override
  _ImageFullScreenState createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends State<ImageFullScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              CircularProgressIndicator(),
              Hero(
                tag: widget.image.user.name,
                child: Image.network(
                  '${widget.image.urls.regular}',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
