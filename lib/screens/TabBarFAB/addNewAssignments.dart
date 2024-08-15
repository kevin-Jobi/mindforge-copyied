import 'package:flutter/material.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class NewAssignments extends StatefulWidget {
  const NewAssignments({super.key,required this.model});
  final Model model;
  @override
  State<NewAssignments> createState() => _NewAssignmentsState();
}

class _NewAssignmentsState extends State<NewAssignments> {
    List <Widget> _wholeAssignmentTextFields=[];
   
    List<TextEditingController>_assignmentControllers=[];
    List<TextEditingController>_assignmentDeadlineControllers=[];
    List<TextEditingController>_assignmentDescriptionControllers=[];


    @override
  void initState() {
    super.initState();
      _assignmentControllers.add(TextEditingController());
      _assignmentDeadlineControllers.add(TextEditingController());
      _assignmentDescriptionControllers.add(TextEditingController());
   
  

    // -----------------------------------------------------------------------------=======
          _wholeAssignmentTextFields.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Container(
            height: 60,
            width: 200,
            child: TextFormField(
                  controller: _assignmentControllers[_assignmentControllers.length-1],
                  decoration: InputDecoration(
            labelText: 'Assingments',
            hintText: 'Assingments',
            border: OutlineInputBorder()
            )
            
                  ),
          ),
        )
          );
  _wholeAssignmentTextFields.add(
  Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _assignmentDeadlineControllers[_assignmentDeadlineControllers.length-1],
            decoration: InputDecoration(
              labelText: 'Deadline',
              hintText: 'Deadline',
              border: OutlineInputBorder()
            ),
          ),
        ),
  )
  );

  _wholeAssignmentTextFields.add(
      Container(
        height: 60,
        width: 200,
        child: TextFormField(
          controller: _assignmentDescriptionControllers[_assignmentDescriptionControllers.length-1],
          decoration: InputDecoration(
            labelText: 'Description',
            hintText: 'Description',
            border: OutlineInputBorder()
          ),
        ),
      ),
      
  );
  }

  void _addAssingmentTextFields(){
  setState(() {
    _assignmentControllers.add(TextEditingController());
    _wholeAssignmentTextFields.add(  
      Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Container(
          height: 60,
            width: 200,
          child: TextFormField(
          controller: _assignmentControllers[_assignmentControllers.length-1],
          decoration: InputDecoration(
            labelText: 'Assingments',
            hintText: 'Assingments',
            border: OutlineInputBorder()
            )
            
          ) as Widget,
        ),
      ));
    _assignmentDeadlineControllers.add(TextEditingController());
    _wholeAssignmentTextFields.add(
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _assignmentDeadlineControllers[_assignmentDeadlineControllers.length-1],
            decoration: InputDecoration(
              labelText: 'Deadline',
              hintText: 'Deadline',
              border: OutlineInputBorder()
            ),
          ),
        ),
      )
    );
  _assignmentDescriptionControllers.add(TextEditingController());
  _wholeAssignmentTextFields.add(
     Padding(
       padding: const EdgeInsets.only(top: 5),
       child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _assignmentDescriptionControllers[_assignmentDescriptionControllers.length-1],
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            ElevatedButton(onPressed: _addAssingmentTextFields,
             child: Text('Add')
             ),
           
           
            
             SizedBox(
              height: 20,
             ),
             ElevatedButton(
                onPressed: ()async{
                  // List<String>assignments=[];
                  // List<String>assignmentDeadline=[];
                  // List<String>assignmentDescription=[];
                  for(int i=0;i<_assignmentControllers.length;i++){
                    if(_assignmentControllers[i].text.isNotEmpty){
                     widget.model. assignments.add(_assignmentControllers[i].text);
                    }
                    if(_assignmentDeadlineControllers[i].text.isNotEmpty){
                      widget.model.assignmentDeadlines!.add(_assignmentDeadlineControllers[i].text);
                    }else{
                      widget.model.assignmentDeadlines!.add('');
                    }
                    if(_assignmentDescriptionControllers[i].text.isNotEmpty){
                     widget.model.assignmentDescriptions.add(_assignmentDescriptionControllers[i].text);
                    }else{
                      widget.model.assignmentDescriptions.add('');
                    }
                  }

                 
                    
                  
                 
                final data= Model(subject: widget.model.subject,duration: widget.model.duration,subtopic: widget.model.subtopic,links: widget.model.links,images: widget.model.images, assignments:  widget.model. assignments,exams: widget.model.exams,assignmentDeadlines:widget.model.assignmentDeadlines,assignmentDescriptions:widget.model.assignmentDescriptions,examDates:widget.model.examDates,examDescriptions:widget.model.examDescriptions);
                       
                    final box= Boxes.getData();
                    print('Type of key is ${widget.model.key}');
                    await box.put( widget.model.key, data);
                    print(box);
                    await data.save();
                    //subTopics=[];
                    print('emtylist${ widget.model.assignmentDeadlines}');
                    print('assignmentController.length is ${_assignmentControllers.length}');
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AssignmentsPage(assignments:widget.model.assignments, model: widget.model,)));
                    Navigator.of(context).pop();
               },
                child: Text('Save'),
                
                )
            ],
        ),
      ),
    );
  }
}