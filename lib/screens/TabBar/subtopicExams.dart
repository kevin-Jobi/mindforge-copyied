import 'package:flutter/material.dart';
import 'package:mind_forge/screens/TabBarFAB/addNewExam.dart';
import 'package:mind_forge/screens/dashboard/details.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class SubtopicExams extends StatefulWidget {
  final MyDetails widget;
  final Model model;
   SubtopicExams({Key? key, required this.widget, required this.model}) : super(key: key);

  @override
  _SubtopicExamsState createState() => _SubtopicExamsState();
}

class _SubtopicExamsState extends State<SubtopicExams> {
  final TextEditingController _examEditController = TextEditingController();
  String newExam = '';
  String examName= '';
  String? examDate='';
  String? examDescription='';

  void _showAlertDialog(BuildContext context, int index, Model model) {
    _examEditController.text = model.exams[index]; // Pre-fill with current exam
    examName=model.exams[index];
    examDate=model.examDates[index];
    examDescription=model.examDescriptions[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                '${examName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 60, 127, 65),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _examEditController,
                    decoration: InputDecoration(
                      hintText: 'Exam',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 87, 179, 92), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      newExam = _examEditController.text;
                      if (_examEditController.text.isNotEmpty) {
                        model.exams[index] = newExam;
                        final box = Boxes.getData();
                        box.put(model.key, model);
                        setState(() {});
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill in the exam'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

 void _showAlertDialogDates(BuildContext context, int index, Model model) {
    _examEditController.text = model.exams[index]; // Pre-fill with current assignment
    examName= model.exams[index];
    examDate=model.examDates[index];
    examDescription=model.examDescriptions[index];
   showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                '${examName} ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
               
                   examDate!.isNotEmpty?
                        Text(
                'Deadline :${examDate} ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ):SizedBox(),
              SizedBox(height: 20),
             examDescription!.isNotEmpty?
                        Text(
                'Description:${examDescription} ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ):SizedBox(),
                
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void deleteExam(Model model, String valueToRemove) async {
    model.exams.remove(valueToRemove);
    await model.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
          backgroundColor: Colors.green[100],

    appBar: AppBar(
      title: Text('Exams'),
      backgroundColor: Colors.green[800],
      automaticallyImplyLeading: false,
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
       child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.widget.exams.length,
        itemBuilder: (context, index) {
          final examData = widget.widget.exams[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                examData,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.green[900],
                ),
              ),
              onTap: () {
                _showAlertDialogDates(context, index, widget.widget.model);
              },
              trailing: PopupMenuButton(
                onSelected: (value) {
                  if (value == 'edit') {
                    _showAlertDialog(context, index, widget.widget.model);
                  } else if (value == 'delete') {
                    deleteExam(widget.widget.model, examData);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit, color: Colors.green[800]),
                      title: Text('Edit'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete, color: Colors.red),
                      title: Text('Delete'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewExams(model: widget.model,))).then((value) => setState(() {
            
          }));
        },
      child: Icon(Icons.add),),
   );
  }
}
