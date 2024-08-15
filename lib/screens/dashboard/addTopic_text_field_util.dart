import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:mind_forge/screens/Assignments/addAssignments&Exam.dart';


// Function to add a new link text field
 addLinkTextField( 
   List<TextEditingController> linkControllers,
   List<Widget> linkTextFields,
  Function setStateCallback
) {
  setStateCallback((){
      linkControllers.add(TextEditingController());
  linkTextFields.add(TextFormField(
    controller: linkControllers.last,
    decoration: InputDecoration(
      labelText: 'Paste link',
      hintText: 'Paste link',
      border: OutlineInputBorder(),
    ),
  ));
  });

}

// Function to add a new subtopic text field
 addSubtopicTextField(
  List<TextEditingController> subtopicControllers,
   List<Widget> subtopicTextFields,
   Function setStateCallback
) {
  setStateCallback((){
    subtopicControllers.add(TextEditingController());
  subtopicTextFields.add(TextFormField(
    controller: subtopicControllers.last,
    decoration: InputDecoration(
      labelText: 'Subtopic',
      hintText: 'Subtopic',
      border: OutlineInputBorder(),
    ),
  ));
  });
  
}


void handleNextButton({
  required BuildContext context,
  required List<TextEditingController> linkControllers,
  required List<TextEditingController> subtopicControllers,
  required String subject,
  required String duration,
  required List<Uint8List> images,
}) {
  List<String> links = [];
  for (int i = 0; i < linkControllers.length; i++) {
    if (linkControllers[i].text.isNotEmpty) {
      links.add(linkControllers[i].text);
    }
  }

  List<String> subTopics = [];
  for (int i = 0; i < subtopicControllers.length; i++) {
    if (subtopicControllers[i].text.isNotEmpty) {
      subTopics.add(subtopicControllers[i].text);
    }
  }

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => AddAssignment(
        subject: subject,
        duration: duration,
        subtopics: subTopics,
        images: images,
        links: links,
      ),
    ),
  );
}

