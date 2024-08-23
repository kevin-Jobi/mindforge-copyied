import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mind_forge/screens/media/image_viewer.dart';
import 'package:mind_forge/screens/media/media_functions.dart';

class MediaImages extends StatefulWidget {
  const MediaImages({super.key});

  @override
  State<MediaImages> createState() => _MediaImagesState();
}

class _MediaImagesState extends State<MediaImages> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Media Images',
          style: TextStyle(
            color: Colors.white,
            fontSize: 29,
          ),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: Container(
        color: Colors.orange[100],
        child: FutureBuilder<List<Uint8List>>(
          future: getAllImages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange[700],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error loading images',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              List<Uint8List> images = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ImageViewer(image: images[index]),
                        ),
                      );
                    },
                    child: Image.memory(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  'No images found',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
