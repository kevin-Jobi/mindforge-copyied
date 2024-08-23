import 'package:flutter/material.dart';
import 'package:mind_forge/screens/exam/examFunctions.dart';

class MyExams extends StatefulWidget {
  const MyExams({super.key});

  @override
  State<MyExams> createState() => _MyExamsState();
}

class _MyExamsState extends State<MyExams> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> examsDetails = getAllExams();
    List<String> exams = examsDetails[0];
    List<String> dates = examsDetails[1];
    List<String> descriptions = examsDetails[2];

    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text('Exams'),
          backgroundColor: Colors.orange[600], // Orange theme
        ),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return buildExamItem(
            context,
            exams[index],
            () {
              showAlertDialogDates(context, index, exams, dates, descriptions);
            },
          );
        },
      ),
    );
  }
}
