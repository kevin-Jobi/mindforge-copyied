import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mind_forge/screens/Assignments/assignmentTextF.dart';
import 'package:mind_forge/screens/Assignments/assignment_initialization.dart';
import 'package:mind_forge/services/repos/save_assignments_exams.dart';

class AddAssignment extends StatefulWidget {
   AddAssignment({super.key,required this.subject,required this.duration,required this.subtopics,required this.links,required this.images});
final String subject;
final String duration; 
final  List <String> subtopics;
 final List <String> links;
 final List <Uint8List> images;

  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {  

  List<TextEditingController>_assignmentControllers=[];
  List<TextEditingController>_assignmentDeadlineControllers=[];
  List<TextEditingController>_assignmentDescriptionControllers=[];

  List<TextEditingController>_examControllers=[];
  List<TextEditingController>_examDateControllers=[];
  List<TextEditingController>_examDescriptionControllers=[];

  List <Widget> _wholeAssignmentTextFields=[];
  List <Widget> _wholeExamTextField=[];
  @override
  void initState() {
    super.initState();

      initializeAssignmentAndExamFields(
      assignmentControllers: _assignmentControllers,
      assignmentDeadlineControllers: _assignmentDeadlineControllers,
      assignmentDescriptionControllers: _assignmentDescriptionControllers,
      wholeAssignmentTextFields: _wholeAssignmentTextFields,
      examControllers: _examControllers,
      examDateControllers: _examDateControllers,
      examDescriptionControllers: _examDescriptionControllers,
      wholeExamTextField: _wholeExamTextField,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Additional'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Add Assingnment',
              style: TextStyle(fontSize: 25),),
            ),
            
            SizedBox(
              
            child: Column(
              children: [
              ..._wholeAssignmentTextFields
              ],
            )
           
            ),
            ElevatedButton(
              onPressed:  (){
                 addAssignmentTextFields(
                _assignmentControllers,
                _assignmentDeadlineControllers,
                _assignmentDescriptionControllers,
                _wholeAssignmentTextFields,
                setState,
              );
              },
             
             child: Text('Add')
             ),
            ListTile(
              title: Text('Add Exams',
              style: TextStyle(fontSize: 25),),
            ),
            SizedBox(
              
              child: 
              Column(
                children: [
            ..._wholeExamTextField
            ],
              )
            ),
            ElevatedButton(
              onPressed: (){
                  addExamTextFields(
              _examControllers,
              _examDateControllers,
              _examDescriptionControllers,
              _wholeExamTextField,
              setState,
            );
              },
            
             child: Text('Add')
             ),
             SizedBox(
              height: 20,
             ),
             ElevatedButton(
                onPressed: ()async{

                   await saveAssignmentsAndExams(
                  subject: widget.subject,
                  duration: widget.duration,
                  subtopics: widget.subtopics,
                  links: widget.links,
                  images: widget.images,
                  assignmentControllers: _assignmentControllers,
                  assignmentDeadlineControllers: _assignmentDeadlineControllers,
                  assignmentDescriptionControllers: _assignmentDescriptionControllers,
                  examControllers: _examControllers,
                  examDateControllers: _examDateControllers,
                  examDescriptionControllers: _examDescriptionControllers,
                );
               },
                child: Text('Save')
                )
            ],
        ),
      ),
    );
  }
}