import 'package:flutter/material.dart';
import 'package:mind_forge/screens/tabBar/subTopics.dart';
import 'package:mind_forge/screens/tabbar/subtopic_assingments.dart';
import 'package:mind_forge/screens/tabbar/subtopic_exams.dart';
import 'package:mind_forge/screens/tabbar/subtopic_images.dart';
import 'package:mind_forge/screens/tabbar/subtopic_link.dart';
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
          backgroundColor: Colors.orange[600], // Matching the theme color
          bottom: 
        //getTabBar()
            TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.topic, color: Colors.red[800]), // Red color
              ),
              Tab(
                icon: Icon(Icons.image, color: Colors.red[700]), // Blue color
              ),
              Tab(
                icon: Icon(Icons.link, color: Colors.red[600]), // Green color
              ),
              Tab(
                icon: Icon(Icons.assignment, color: Colors.red[500]), // Purple color
              ),
              Tab(
                icon: Icon(Icons.local_activity, color: Colors.red[400]), // Teal color
              ),
            ],
          )
        ),
        body: Container(
          color: Colors.orange[50], // Light orange background
          child: TabBarView(
            children: [
              Subtopics(widget: widget, model: widget.model),
              SubtopicImages(widget: widget),
              SubTopicLink(widget: widget),
              AssignmentsPage(assignments: widget.assignments, model: widget.model), // Use the updated AssignmentsPage widget
              SubtopicExams(widget: widget, model: widget.model),
            ],
          ),
        ),
      ),
    );
  }
}
