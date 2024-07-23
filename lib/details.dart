import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDetails extends StatefulWidget {
   MyDetails({Key? key,required this.subject, required this.subTopics}) :super(key: key);
final String subject;
final List <String>subTopics;
  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.subject) ,
        
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount:widget.subTopics.length,
          itemBuilder: (context,index){
            var data=widget.subTopics[index];
            print( 'recived data is ${data}');
            return ListTile(title: Text(data));
          }
          ),
      ),
        

    );
  }
  
}