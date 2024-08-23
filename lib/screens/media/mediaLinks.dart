import 'package:flutter/material.dart';
import 'package:mind_forge/screens/media/media_functions.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class MediaLinks extends StatefulWidget {
  const MediaLinks({super.key});

  @override
  State<MediaLinks> createState() => _MediaLinksState();
}

class _MediaLinksState extends State<MediaLinks> {
  List<String> getAllLinks() {
    List<String> allLinks = [];
    final box = Boxes.getData();
    for (var model in box.values) {
      allLinks.addAll(model.links);
    }
    return allLinks;
  }

@override
  Widget build(BuildContext context) {
    List<String> links = getAllLinks();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Media Links',
          style: TextStyle(
            color: Colors.white,
            fontSize: 29,
          ),
        ),
        backgroundColor: Colors.orange[600],
      ),
      body: Container(
      
        color: Colors.orange[100],
        child: ListView.builder(
          itemCount: links.length,
          itemBuilder: (context, index) {
            return Card(
              
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.orange[200],
              child: ListTile(
               
                title: Text(
                  links[index],
                  style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  launchURL(links[index],context);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
