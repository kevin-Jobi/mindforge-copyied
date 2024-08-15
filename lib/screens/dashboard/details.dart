import 'package:flutter/material.dart';
import 'package:mind_forge/screens/TabBar/subTopics.dart';
import 'package:mind_forge/screens/TabBar/subtopicAssingments.dart';
import 'package:mind_forge/screens/TabBar/subtopicExams.dart';
import 'package:mind_forge/screens/TabBar/subtopicImages.dart';
import 'package:mind_forge/screens/TabBar/subtopicLink.dart';
import 'package:mind_forge/services/models/model.dart';


class MyDetails extends StatefulWidget {
  MyDetails({
    Key? key,
    required this.subject,
    required this.subTopics,
    required this.imageList,
    required this.linkList,
    required this.assignments,
    required this.exams,
    required this.ModelKey,
    required this.model,
  }) : super(key: key);

  final String subject;
  final List<String> subTopics;
  final List<dynamic> imageList;
  final List<String> linkList;
  final List<String> assignments;
  final List<String> exams;
  final Model model;
  final ModelKey;

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  var assignmentdata;
  String newAssignment = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.subject),
          backgroundColor: const Color.fromARGB(255, 67, 163, 72),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.topic)),
              Tab(icon: Icon(Icons.image)),
              Tab(icon: Icon(Icons.link)),
              Tab(icon: Icon(Icons.assignment)),
              Tab(icon: Icon(Icons.local_activity)),
            ],
          ),
        ),
        body: Container(
          color: Colors.green[100], // Green background
          child: TabBarView(
            children: [
              Subtopics(widget: widget,model: widget.model),
              SubtopicImages(widget: widget),
              SubTopicLink(widget: widget),
              AssignmentsPage(assignments: widget.assignments, model: widget.model), // Use the updated AssignmentsPage widget
              SubtopicExams(widget: widget,model: widget.model,),
            ],
          ),
        ),
      ),
    );
  }
}