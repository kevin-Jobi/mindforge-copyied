import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class NewExams extends StatefulWidget {
  const NewExams({super.key,required this.model});
final Model model;
  @override
  State<NewExams> createState() => _NewExamsState();
}

class _NewExamsState extends State<NewExams> {
  
   List <Widget> _wholeExamTextField=[];
       List<TextEditingController>_examControllers=[];
    List<TextEditingController>_examDateControllers=[];
    List<TextEditingController>_examDescriptionControllers=[];
        @override
  void initState() {
    
    super.initState();
     
   
    _examControllers.add(TextEditingController());
    _examDateControllers.add(TextEditingController());
    _examDescriptionControllers.add(TextEditingController());
    _wholeExamTextField.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Container(
            height: 60,
            width: 200,
             child: TextFormField(
                   controller: _examControllers[0],
                   decoration: InputDecoration(
                     labelText: 'Exams',
                     hintText: 'Exams',
                     border: OutlineInputBorder()
                     )
                     
                   ),
           ),
        )
    );
      _wholeExamTextField.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _examDateControllers[0],
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Date',
              hintText: 'Date',
              border: OutlineInputBorder()
            ),
               onTap: () async{
              DateTime? pickedDate = await showDatePicker(
                context: context,
                 firstDate: DateTime.now(),
                  initialDate: DateTime.now(),
                   lastDate: DateTime(2100)
                   );
                   if(pickedDate !=null){
                    String formatedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                    _examDateControllers[0].text = formatedDate;
                   }
            },
          ),
        ),
      )
    );
       _wholeExamTextField.add(
       Container(
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
      )
    );
  }
    // -----------------------------------------------------------------------------=======
    
  void _addExamTextFields(){
  setState(() {
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
            decoration: InputDecoration(
              labelText: 'Data',
              hintText: 'Date',
              border: OutlineInputBorder()
            ),
               onTap: () async{
              DateTime? pickedDate = await showDatePicker(
                context: context,
                 firstDate: DateTime.now(),
                  initialDate: DateTime.now(),
                   lastDate: DateTime(2100)
                   );
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


  
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: Text('Additional'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            
          
           
            ListTile(
              title: Text('Add Exams',
              style: TextStyle(fontSize: 25),),
            ),
            SizedBox(
              
              child: 
              Column(
                children: [
                //   TextField(
                //  controller: _examController,
                //   decoration: InputDecoration(
                //     hintText: 'Exams',
                //     border: OutlineInputBorder()
                //   ),
                // ),


                // ..._examTextFields,
                // ..._examDateTextFields,
                // ..._examDescriptionTextFields

                ..._wholeExamTextField

                ],
              )
            ),
            ElevatedButton(
              onPressed: _addExamTextFields,
             child: Text('Add')),
             SizedBox(
              height: 20,
             ),
             ElevatedButton(
                onPressed: ()async{
                

                  // List<String>exams=[];
                  // List<String>examsDate=[];
                  // List<String>examDescription=[];
                  for(int i=0;i<_examControllers.length;i++){
                    if(_examControllers[i].text.isNotEmpty){
                      widget.model. exams.add(_examControllers[i].text);
                    }
                     if(_examDateControllers[i].text.isNotEmpty){
                    widget.model.examDates.add(_examDateControllers[i].text);
                    }else{
                      widget.model.examDates.add('');
                    }
                    if(_examDescriptionControllers[i].text.isNotEmpty){
                     widget.model.examDescriptions.add(_examDescriptionControllers[i].text);
                    }else{
                      widget.model.examDescriptions.add('');
                    }
                  }
                    
                  
                  // print(exams);
                final data= Model(
                  subject: widget.model.subject,
                  duration: widget.model.duration,
                  subtopic: widget.model.subtopic,
                  links: widget.model.links,
                  images: widget.model.images,
                   assignments:widget.model. assignments,
                   exams: widget.model.exams,
                   assignmentDeadlines:widget.model.assignmentDeadlines,
                   assignmentDescriptions:widget.model.assignmentDescriptions,
                   examDates:widget.model.examDates,
                   examDescriptions:widget.model. examDescriptions,
                   subtopicChecked: widget.model.subtopicChecked
                   );
                       
                    final box= Boxes.getData();
                    await box.put(widget.model.key, data);
                    print(box);
                    await data.save();
                    //subTopics=[];
                    
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddAssignment(subject: widget.subject, duration: widget.duration, subtopics:subTopics, images:bytesList, links:links ,)));
                    Navigator.of(context).pop();
               },
                child: Text('Save')
                )
            ],
        ),
      ),
    );
  }
}