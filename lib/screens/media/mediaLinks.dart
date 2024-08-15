import 'package:flutter/material.dart';
import 'package:mind_forge/services/repos/boxes.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaLinks extends StatefulWidget {
  const MediaLinks({super.key});

  @override
  State<MediaLinks> createState() => _MediaLinksState();
}

class _MediaLinksState extends State<MediaLinks> {
  List <String> getAllLinks(){
    List <String> allLinks=[];
    final box =Boxes.getData();
    for(var model in box.values){
      allLinks.addAll(model.links);
    }
    return allLinks;
  }

  void _launchURL(String url)async{
    final Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    List<String> links=getAllLinks();
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Links'),
      ),
      body: ListView.builder(
        itemCount: links.length,
        itemBuilder: ((context, index) {
        return ListTile(
          title: Text(
            links[index],
            style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
          ),
          onTap: (){
            _launchURL(links[index]);
          },
        );
      })),
    );
  }
}