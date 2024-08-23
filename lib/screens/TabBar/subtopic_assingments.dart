import 'package:flutter/material.dart';
import 'package:mind_forge/screens/tabBar/alert_dialog_util.dart';
import 'package:mind_forge/screens/tabbarfab/add_new_assignments.dart';
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

  void deleteAssignment(Model model, String valuetoRemove, String valuetoRdeadline, String valuetoRdescription ) async {
    model.assignments.remove(valuetoRemove);
    model.assignmentDeadlines!.remove(valuetoRdeadline);
    model.assignmentDescriptions.remove(valuetoRdescription);
    await model.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100], // Orange background
      appBar: AppBar(
        title: Text('Assignments'),
        backgroundColor: Colors.green[700], // Green app bar
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.assignments.length,
          itemBuilder: (context, index) {
            final assignmentData = widget.assignments[index];
            final assignmentDeadlineData = widget.model.assignmentDeadlines![index];
            final assignmentDescriptionData = widget.model.assignmentDescriptions[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  assignmentData,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900], // Text color
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
                      deleteAssignment(widget.model, assignmentData,assignmentDeadlineData,assignmentDescriptionData);
                      setState(() {});
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: ListTile(
                        leading: Icon(Icons.edit, color: Colors.green[800]), // Edit icon color
                        title: Text('Edit'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: ListTile(
                        leading: Icon(Icons.delete, color: Colors.red), // Delete icon color
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewAssignments(model: widget.model,context: context,))).then((value) => setState(() {}));
        },
        backgroundColor: Colors.deepOrange[600], // FloatingActionButton color
        child: Icon(Icons.add),
      ),
    );
  }
}
