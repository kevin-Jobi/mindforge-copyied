import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:mind_forge/screens/assignments/addAssignments&Exam.dart';


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


initializeTextfields(_linkControllers,_linkTextFields,_subtopicControllers,_subtopicTextFields){
    _linkControllers.add(TextEditingController());
    _linkTextFields.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _linkControllers[0],
          decoration: InputDecoration(
            labelText: 'Enter link',
            hintText: 'Paste link',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green[900]!, width: 3.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green[700]!, width: 3.0),
            ),
          ),
        ),
      ),
    );

    _subtopicControllers.add(TextEditingController());
    _subtopicTextFields.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _subtopicControllers[0],
          decoration: InputDecoration(
            labelText: 'Enter subtopic',
            hintText: 'Subtopic',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green[900]!, width: 3.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green[700]!, width: 3.0),
            ),
          ),
        ),
      ),
    );
}

