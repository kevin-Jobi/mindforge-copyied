import 'package:flutter/material.dart';

void initializeAssignmentAndExamFields({
  required List<TextEditingController> assignmentControllers,
  required List<TextEditingController> assignmentDeadlineControllers,
  required List<TextEditingController> assignmentDescriptionControllers,
  required List<Widget> wholeAssignmentTextFields,
  required List<TextEditingController> examControllers,
  required List<TextEditingController> examDateControllers,
  required List<TextEditingController> examDescriptionControllers,
  required List<Widget> wholeExamTextField,
}) {
  // Initialize Assignment Controllers and Widgets
  assignmentControllers.add(TextEditingController());
  assignmentDeadlineControllers.add(TextEditingController());
  assignmentDescriptionControllers.add(TextEditingController());

  wholeAssignmentTextFields.add(
    Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 60,
        width: 200,
        child: TextFormField(
          controller: assignmentControllers[0],
          decoration: InputDecoration(
            labelText: 'Assignments',
            hintText: 'Assignments',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ),
  );

  wholeAssignmentTextFields.add(
    Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 60,
        width: 200,
        child: TextFormField(
          controller: assignmentDeadlineControllers[0],
          decoration: InputDecoration(
            labelText: 'Deadline',
            hintText: 'Deadline',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ),
  );

  wholeAssignmentTextFields.add(
    Container(
      height: 60,
      width: 200,
      child: TextFormField(
        controller: assignmentDescriptionControllers[0],
        decoration: InputDecoration(
          labelText: 'Description',
          hintText: 'Description',
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );

  // Initialize Exam Controllers and Widgets
  examControllers.add(TextEditingController());
  examDateControllers.add(TextEditingController());
  examDescriptionControllers.add(TextEditingController());

  wholeExamTextField.add(
    Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 60,
        width: 200,
        child: TextFormField(
          controller: examControllers[0],
          decoration: InputDecoration(
            labelText: 'Exams',
            hintText: 'Exams',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ),
  );

  wholeExamTextField.add(
    Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 60,
        width: 200,
        child: TextFormField(
          controller: examDateControllers[0],
          decoration: InputDecoration(
            labelText: 'Date',
            hintText: 'Date',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ),
  );

  wholeExamTextField.add(
    Container(
      height: 60,
      width: 200,
      child: TextFormField(
        controller: examDescriptionControllers[0],
        decoration: InputDecoration(
          labelText: 'Description',
          hintText: 'Description',
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );
}
