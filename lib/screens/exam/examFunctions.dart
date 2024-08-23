  import 'package:flutter/material.dart';
import 'package:mind_forge/services/repos/boxes.dart';

List<List<String>> getAllExams() {
    List<String> allExams = [];
    List<String> allDates = [];
    List<String> allDescription = [];
    
    final box = Boxes.getData();
    for (var model in box.values) {
      allExams.addAll(model.exams);
      allDates.addAll(model.examDates);
      allDescription.addAll(model.examDescriptions);
    }
    return [allExams, allDates, allDescription];
  }


 void showAlertDialogDates(BuildContext context, int index, List<String> exams, List<String> dates, List<String> descriptions) {
    String examName = exams[index];
    String examDate = dates[index];
    String examDescription = descriptions[index];
    
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
                examName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[900],
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (examDate.isNotEmpty)
                    Text(
                      'Date: $examDate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                  SizedBox(height: 20),
                  if (examDescription.isNotEmpty)
                    Text(
                      'Description: $examDescription',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


    Widget buildExamItem(BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.orange[200],
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.orange[300]!, // Border color
              width: 5.0, // Increased border width
            ),
          ),
          child: ListTile(
            title: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange[900],
                ),
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }