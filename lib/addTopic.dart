import 'package:flutter/material.dart';
import 'package:mind_forge/model.dart';

class AddTopic extends StatefulWidget {
   AddTopic({super.key, required this.subject});
  
  //List <Model> data=[];
final String subject;
  @override
  State<AddTopic> createState() => _AddTopicState();
}

class _AddTopicState extends State<AddTopic> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.subject),
        //title: Text(widget.dataModel[index].subject.toString())
      ),
    );
  }
}