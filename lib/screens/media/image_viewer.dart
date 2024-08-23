import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key,required this.image});
  final Uint8List image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Image'),
      ),
      body: Center(
        child: Image.memory(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}