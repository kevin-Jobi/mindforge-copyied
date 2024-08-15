import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mind_forge/screens/media/imageViewer.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class MediaImages extends StatefulWidget {
  const MediaImages({super.key});

  @override
  State<MediaImages> createState() => _MediaImagesState();
}

class _MediaImagesState extends State<MediaImages> {
Future<List<Uint8List>> getAllImages()async{
  await Future.delayed(Duration(seconds:1));
  List<Uint8List> allImages=[];
  final box=Boxes.getData();
  for(var model in box.values){
    allImages.addAll(model.images);
  }
  return allImages;
}
  @override
  Widget build(BuildContext context) {
    // List<Uint8List> images=getAllImages();
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Images'),
      ),
      body: FutureBuilder<List<Uint8List>>(
        future: getAllImages(),
         builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasError){
            return Center(
              child: Text('Error loading images'),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty){
            List<Uint8List> images =snapshot.data!;
            return   GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4
      ),
      itemCount: images.length,
       itemBuilder: ((context, index) {
         return GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ImageViewer(image: images[index])));
          },
           child: Image.memory(
            images[index],
            fit:BoxFit.cover
           ),
         );
       }
       )
       );

          } else{
            return Center(
                child: Text('No image found'),
            );
            
          }
         })

     
        
     
    );
  }
}