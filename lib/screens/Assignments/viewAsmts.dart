import 'package:flutter/material.dart';
import 'package:mind_forge/screens/assignments/assignmentsData.dart';

class MyAssignments extends StatefulWidget {
  const MyAssignments({super.key});

  @override
  State<MyAssignments> createState() => _MyAssignmentsState();
}

class _MyAssignmentsState extends State<MyAssignments> {

  @override
  Widget build(BuildContext context) {
    List<List<String>> assignmentDetails = getAllAssignments();
    List<String> assignments = assignmentDetails[0];
    List<String> assignmentDeadlines = assignmentDetails[1];
    List<String> descriptions = assignmentDetails[2];

    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text('Assignments'),
          backgroundColor: Colors.orange[600], // Orange theme
        ),
      ),
      body: ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          return buildAssignmentItem(
            context,
            assignments[index],
            () {
              showAlertDialogDates(context, index, assignments, assignmentDeadlines, descriptions);
            },
          );
        },
      ),
    );
  }
}
