import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mind_forge/screens/dashboard/image_picker_util.dart';
import 'package:mind_forge/screens/dashboard/addTopic_text_field_util.dart';

class AddTopic extends StatefulWidget {
   AddTopic({super.key, required this.subject,required this.duration});

final String subject;
final String duration;  
  @override
  State<AddTopic> createState() => _AddTopicState();
}

class _AddTopicState extends State<AddTopic> {

  List<TextEditingController>_linkcontrollers=[];
  List<TextEditingController>_subtopicControllers=[];
  List <Widget> _linkTextFields=[];
  List <Widget> _subtopicTextFields=[];
  List <Uint8List>bytesList=[];

@override
  void initState() {
    super.initState();
    _linkcontrollers.add(TextEditingController());
    _linkTextFields.add(
        TextFormField(
      controller: _linkcontrollers[0],
      decoration: InputDecoration(
        labelText: 'Enter something',
        hintText: 'Paste link',
        border: OutlineInputBorder()
        )
        
      )
    );
    _subtopicControllers.add(TextEditingController());
    _subtopicTextFields.add(
         TextFormField(
      controller: _subtopicControllers[0],
      decoration: InputDecoration(
        labelText: 'Enter subtopic',
        hintText: 'subtopic',
        border: OutlineInputBorder()
        )
        
      )
    );
  }
      


  List <String> subTopics=[];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.subject),
      automaticallyImplyLeading: false,
  ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
             ..._subtopicTextFields,
              ElevatedButton(
                onPressed: (){
                   addSubtopicTextField(   
                   _subtopicControllers,
                   _subtopicTextFields,
                   setState
                );
                },
               
               child: Text('Add +') 
               ),
               SizedBox(
                height: 20,
               ),
               
                ..._linkTextFields,                           //----------------------------for link
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (){
                     addLinkTextField(
                      _linkcontrollers,
                  _linkTextFields,
                   setState 
                  );
                  },
                               //----------------------------for link
                child: Text('Add Field+')
                   ),
                   SizedBox(
                    height: 20,
                   ),
        
                   GestureDetector(child: Container(
                    height: 100,
                    width: 100,
                     decoration: BoxDecoration(
                      image: DecorationImage(
                        image: bytesList.isNotEmpty?
                        MemoryImage(bytesList.last) as ImageProvider:
                        AssetImage('assets/images/Screenshot 2024-07-25 121548.png'),
                        fit:BoxFit.cover)
                        )
                        ),
                        onTap: ()async{
                          bytesList = await pickAndStoreImage();
                          setState(() {
                            
                          });
                        }
                        ),
        
               ElevatedButton(
                onPressed: (){
               handleNextButton(
                    context: context,
                    linkControllers: _linkcontrollers,
                    subtopicControllers: _subtopicControllers,
                    subject: widget.subject,
                    duration: widget.duration,
                    images: bytesList,
                  );
               },
                child: Text('Next')
                )
            ],
          ),
          
        ),
      ),
      
    );
  }
}