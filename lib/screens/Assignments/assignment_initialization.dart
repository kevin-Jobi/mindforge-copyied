import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void initializeAssignmentAndExamFields({
  required List<TextEditingController> assignmentControllers,
  required List<TextEditingController> assignmentDeadlineControllers,
  required List<TextEditingController> assignmentDescriptionControllers,
  required List<Widget> wholeAssignmentTextFields,
  required List<TextEditingController> examControllers,
  required List<TextEditingController> examDateControllers,
  required List<TextEditingController> examDescriptionControllers,
  required List<Widget> wholeExamTextField,
  required context 
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
          keyboardType: TextInputType.number,
          controller: assignmentDeadlineControllers[0],
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Deadline',
            hintText: 'Deadline',
            border: OutlineInputBorder(),
          ),
          onTap: ()async{
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
               firstDate: DateTime.now(),
                lastDate: DateTime(2100)
                );
                if(pickedDate !=null) {
                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                  assignmentDeadlineControllers[0].text = formattedDate;
                }
          },
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
          keyboardType: TextInputType.number,
          controller: examDateControllers[0],
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date',
            hintText: 'Date',
            border: OutlineInputBorder(),
          ),
          onTap: () async{
            DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
              lastDate: DateTime(2100));
              if(pickedDate !=null){
                String formatedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                examDateControllers[0].text=formatedDate;
              }
          },
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
