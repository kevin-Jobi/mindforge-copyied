import 'package:flutter/material.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

void showEditAssignmentDialog({
  required BuildContext context,
  required int index,
  required Model model,
  required TextEditingController assignmentEditController,
  required Function() onSave, // Callback to handle save
}) {
  assignmentEditController.text = model.assignments[index];
  String assignmentName = model.assignments[index];
  String? deadline = model.assignmentDeadlines?[index];

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
              assignmentName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: assignmentEditController,
                  decoration: InputDecoration(
                    hintText: 'Assignment',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                deadline == null
                    ? Container()
                    : deadline.isNotEmpty
                        ? Text(
                            'Deadline: $deadline',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                            ),
                          )
                        : SizedBox(),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 114, 202, 119), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    onSave();
                    if (assignmentEditController.text.isNotEmpty) {
                      model.assignments[index] = assignmentEditController.text;
                      final box = Boxes.getData();
                      box.put(model.key, model);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill in the assignment'),
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

void showAssignmentDetailsDialog({
  required BuildContext context,
  required int index,
  required Model model,
}) {
  String assignmentName = model.assignments[index];
  String? deadline = model.assignmentDeadlines?[index];
  String? assignmentDescription = model.assignmentDescriptions[index];

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
              assignmentName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                deadline != null && deadline.isNotEmpty
                    ? Text(
                        'Deadline: $deadline',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 20),
                assignmentDescription.isNotEmpty
                    ? Text(
                        'Description: $assignmentDescription',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      );
    },
  );
}
