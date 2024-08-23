import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_forge/screens/dashboard/add_topic.dart';

void showAlertDialog(BuildContext context, TextEditingController subjectController, TextEditingController durationController) {
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
              'Add Subject',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green[900], // Updated color
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    hintText: 'Subject',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange[300]!), // Border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange[600]!, width: 2.0), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: durationController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange[300]!), // Border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange[600]!, width: 2.0), // Focused border color
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      durationController.text = formattedDate;
                    }
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[800], // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (subjectController.text.isNotEmpty && durationController.text.isNotEmpty) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddTopic(
                          subject: subjectController.text,
                          duration: durationController.text,
                        ),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill the bar'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
            backgroundColor: Colors.orange[100],
          ),
        ),
      );
    },
    
  );
}
