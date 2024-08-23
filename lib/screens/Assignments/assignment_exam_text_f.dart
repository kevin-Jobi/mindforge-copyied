import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

 addAssignmentTextFields(
    List<TextEditingController> assignmentControllers,
    List<TextEditingController> assignmentDeadlineControllers,
    List<TextEditingController> assignmentDescriptionControllers,
    List<Widget> wholeAssignmentTextFields,
    Function setStateCallback,
    context 
    ) {

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
                readOnly: true,
            decoration: InputDecoration(
              labelText: 'Deadline',
              hintText: 'Deadline',
              border: OutlineInputBorder(),
            ),
              onTap: ()async{
              DateTime? pickedDate =await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                 firstDate: DateTime.now(),
                  lastDate: DateTime(2100)
                  );
                  if(pickedDate !=null){
                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                    assignmentDeadlineControllers[assignmentDeadlineControllers.length - 1].text = formattedDate;
                  }
            },
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
  Function setStateCallback,
  context
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
            controller: _examDateControllers[_examDateControllers.length-1],
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Date',
              hintText: 'Date',
              border: OutlineInputBorder()
            ),
            onTap: ()async{
              DateTime? pickedDate = await showDatePicker(
                context: context,
                 firstDate: DateTime.now(),
                 initialDate: DateTime.now(),
                lastDate: DateTime(2100)); 
                if(pickedDate !=null){
                  String formatedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                  _examDateControllers[_examDateControllers.length-1].text = formatedDate;
                }
            },
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
            controller: _examDescriptionControllers[_examDescriptionControllers.length-1],
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