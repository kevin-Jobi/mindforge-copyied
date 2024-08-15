import 'package:flutter/material.dart';
import 'package:mind_forge/screens/TabBar/alert_dialog_util.dart';
import 'package:mind_forge/screens/TabBarFAB/addNewAssignments.dart';
import 'package:mind_forge/services/models/model.dart';

class AssignmentsPage extends StatefulWidget {
  final List<String> assignments;
  final Model model;

  AssignmentsPage({required this.assignments, required this.model});  

  @override
  _AssignmentsPageState createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {
  final TextEditingController _assignmentEditController = TextEditingController();
  String newAssignment = '';
  String assignmentName='';
  String? deadline='';
  String? assignmentDescription='';
  // void _showAlertDialog(BuildContext context, int index, Model model) {
  //   _assignmentEditController.text = model.assignments[index]; // Pre-fill with current assignment
  //   assignmentName= model.assignments[index];
  //   deadline=model.assignmentDeadlines?[index];
  //    deadline==null?Container():deadline!.isNotEmpty?
  //                       Text(
  //               'Deadline :${deadline} ',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.green[900],
  //               ),
  //             ):SizedBox();
                
    
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Center(
  //         child: SingleChildScrollView(
  //           child: AlertDialog(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(15),
  //             ),
  //             title: Text(
  //               '${assignmentName} ',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.green[900],
  //               ),
  //             ),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextField(
  //                   controller: _assignmentEditController,
  //                   decoration: InputDecoration(
  //                     hintText: 'Assignment',
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                   ),
  //                 ),
           
  //                SizedBox(height: 20),
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color.fromARGB(255, 114, 202, 119), // Button color
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                   ),
  //                   onPressed: () {
  //                     newAssignment = _assignmentEditController.text;
  //                     if (_assignmentEditController.text.isNotEmpty) {
  //                       model.assignments[index] = newAssignment;
  //                       final box = Boxes.getData();
  //                       box.put(model.key, model);
  //                       setState(() {});
  //                       Navigator.of(context).pop();
  //                     } else {
  //                       ScaffoldMessenger.of(context).showSnackBar(
  //                         SnackBar(
  //                           content: Text('Please fill in the assignment'),
  //                           backgroundColor: Colors.red,
  //                         ),
  //                       );
  //                     }
  //                   },
  //                   child: Text('Save'),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }


  //   void _showAlertDialogDeadlines(BuildContext context, int index, Model model) {
  //   _assignmentEditController.text = model.assignments[index]; // Pre-fill with current assignment
  //   assignmentName= model.assignments[index];
  //   deadline=model.assignmentDeadlines?[index];
  //   assignmentDescription=model.assignmentDescriptions?[index];
      
  //     showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Center(
  //         child: SingleChildScrollView(
  //           child: AlertDialog(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(15),
  //             ),
  //             title: Text(
  //               '${assignmentName} ',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.green[900],
  //               ),
  //             ),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
                
  //                  deadline!.isNotEmpty?
  //                       Text(
  //               'Deadline :${deadline} ',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.green[900],
  //               ),
  //             ):SizedBox(),

                  
  //                SizedBox(height: 20),
             
                

  //                assignmentDescription!.isNotEmpty?
  //                       Text(
  //               'Description:${assignmentDescription} ',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.green[900],
  //               ),
  //             ):SizedBox(),
                
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void deleteAssignment(Model model, String valuetoRemove) async {
    model.assignments.remove(valuetoRemove);
    await model.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100], // Green background
      appBar: AppBar(
        title: Text('Assignments'),
        backgroundColor: Colors.green[800],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.assignments.length,
          itemBuilder: (context, index) {
            final assignmentData = widget.assignments[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  assignmentData,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900],
                  ),
                ),
                onTap: () {
                  // _showAlertDialogDeadlines(context, index, widget.model);
                   showAssignmentDetailsDialog(
                    context: context,
                    index: index,
                    model: widget.model,
                  );
                },
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'edit') {
                      // _showAlertDialog(context, index, widget.model);
                        showEditAssignmentDialog(
                        context: context,
                        index: index,
                        model: widget.model,
                        assignmentEditController: _assignmentEditController,
                        onSave: () => setState(() {}),
                      );
                    } else if (value == 'delete') {
                      deleteAssignment(widget.model, assignmentData);
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewAssignments(model: widget.model,))).then((value) => setState(() {
            
          }));
        },
      child: Icon(Icons.add),
      ),
    );
  }
}
