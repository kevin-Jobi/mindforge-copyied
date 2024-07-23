import 'package:flutter/material.dart';
import 'package:mind_forge/boxes.dart';
import 'package:mind_forge/model.dart';

class AddTopic extends StatefulWidget {
   AddTopic({super.key, required this.subject,required this.duration});
  
  // List <Model> data=[];
final String subject;
final String duration;
  @override
  State<AddTopic> createState() => _AddTopicState();
}

class _AddTopicState extends State<AddTopic> {
  final TextEditingController _subtopicController=TextEditingController();
  final TextEditingController _linkController=TextEditingController();

List <Widget> _textFields=[TextFormField(
      decoration: InputDecoration(labelText: 'Enter something'),)];
void _addTextFields(){
  setState(() {
    _textFields.add(TextFormField(
      decoration: InputDecoration(labelText: 'Enter something'),
    ));
   });
}
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  List <String> subTopics=[];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.subject),
      automaticallyImplyLeading: false,
        //title: Text(widget.dataModel[index].subject.toString())
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _subtopicController,
              decoration: InputDecoration(
                hintText: 'subtopic',
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
              onPressed: (){
                subTopics.add(_subtopicController.text);
                print(subTopics);
                _subtopicController.clear();
              },
             child: Text('Add +')
             ),
             SizedBox(
              height: 20,
             ),
              // TextField(
              //   controller: _linkController,
              //   decoration: InputDecoration(
              //     hintText: 'Paste links',
              //     border: OutlineInputBorder()
              //   ),
              // ),
              ..._textFields,
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _addTextFields,
                
                 child: Text('Add+')),
             ElevatedButton(
              onPressed: (){
              final data= Model(subject: widget.subject,duration: widget.duration,subtopic: subTopics);
                     
                  final box= Boxes.getData();
                  box.add(data);
                  print(box);
                  data.save();
                  subTopics=[];
                  print('emtylist${subTopics}');
             },
              child: Text('Save')
              )
          ],
        ),
        
      ),
      
    );
  }
}