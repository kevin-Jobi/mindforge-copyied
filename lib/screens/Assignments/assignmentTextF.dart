import 'package:flutter/material.dart';

 addAssignmentTextFields(
    List<TextEditingController> assignmentControllers,
    List<TextEditingController> assignmentDeadlineControllers,
    List<TextEditingController> assignmentDescriptionControllers,
    List<Widget> wholeAssignmentTextFields,
    Function setStateCallback) {

  setStateCallback(() {
    assignmentControllers.add(TextEditingController());
    wholeAssignmentTextFields.add(
      Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: assignmentControllers[assignmentControllers.length - 1],
            decoration: InputDecoration(
              labelText: 'Assignments',
              hintText: 'Assignments',
              border: OutlineInputBorder(),
            ),
          ) as Widget,
        ),
      ),
    );

    assignmentDeadlineControllers.add(TextEditingController());
    wholeAssignmentTextFields.add(
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller:
                assignmentDeadlineControllers[assignmentDeadlineControllers.length - 1],
            decoration: InputDecoration(
              labelText: 'Deadline',
              hintText: 'Deadline',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );

    assignmentDescriptionControllers.add(TextEditingController());
    wholeAssignmentTextFields.add(
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller:
                assignmentDescriptionControllers[assignmentDescriptionControllers.length - 1],
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  });
  
}


 addExamTextFields(
   List<TextEditingController>_examControllers,
  List<TextEditingController>_examDateControllers,
  List<TextEditingController>_examDescriptionControllers,
  List <Widget> _wholeExamTextField,
  Function setStateCallback
){
  setStateCallback(() {
    _examControllers.add(TextEditingController());
    _wholeExamTextField.add( 
       Padding(
         padding: const EdgeInsets.only(top: 18),
         child: Container(
          height: 60,
            width: 200,
           child: TextFormField(
                 controller: _examControllers[_examControllers.length-1],
                 decoration: InputDecoration(
            labelText: 'Exams',
            hintText: 'Exams',
            border: OutlineInputBorder()
            )
            
                 ) as Widget,
         ),
       ));
       _examDateControllers.add(TextEditingController());
       _wholeExamTextField.add(
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _examDateControllers[0],
            decoration: InputDecoration(
              labelText: 'Data',
              hintText: 'Date',
              border: OutlineInputBorder()
            ),
          ),
                ),
        )
       );
       _examDescriptionControllers.add(TextEditingController());
       _wholeExamTextField.add(
         Padding(
           padding: const EdgeInsets.only(top: 5),
           child: Container(
                   height: 60,
                   width: 200,
                   child: TextFormField(
            controller: _examDescriptionControllers[0],
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Description',
              border: OutlineInputBorder()
            ),
                   ),
                 ),
         )
       );
   });
}