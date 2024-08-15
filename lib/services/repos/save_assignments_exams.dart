import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

Future<void> saveAssignmentsAndExams({
  required String subject,
  required String duration,
  required List<String> subtopics,
  required List<String> links,
  required List<Uint8List> images,
  required List<TextEditingController> assignmentControllers,
  required List<TextEditingController> assignmentDeadlineControllers,
  required List<TextEditingController> assignmentDescriptionControllers,
  required List<TextEditingController> examControllers,
  required List<TextEditingController> examDateControllers,
  required List<TextEditingController> examDescriptionControllers,
}) async {
  List<String> assignments = [];
  List<String> assignmentDeadline = [];
  List<String> assignmentDescription = [];

  for (int i = 0; i < assignmentControllers.length; i++) {
    if (assignmentControllers[i].text.isNotEmpty) {
      assignments.add(assignmentControllers[i].text);
    }
    if (assignmentDeadlineControllers[i].text.isNotEmpty) {
      assignmentDeadline.add(assignmentDeadlineControllers[i].text);
    } else {
      assignmentDeadline.add('');
    }
    if (assignmentDescriptionControllers[i].text.isNotEmpty) {
      assignmentDescription.add(assignmentDescriptionControllers[i].text);
    } else {
      assignmentDescription.add('');
    }
  }

  List<String> exams = [];
  List<String> examsDate = [];
  List<String> examDescription = [];

  for (int i = 0; i < examControllers.length; i++) {
    if (examControllers[i].text.isNotEmpty) {
      exams.add(examControllers[i].text);
    }
    if (examDateControllers[i].text.isNotEmpty) {
      examsDate.add(examDateControllers[i].text);
    } else {
      examsDate.add('');
    }
    if (examDescriptionControllers[i].text.isNotEmpty) {
      examDescription.add(examDescriptionControllers[i].text);
    } else {
      examDescription.add('');
    }
  }

  final data = Model(
    subject: subject,
    duration: duration,
    subtopic: subtopics,
    links: links,
    images: images,
    assignments: assignments,
    exams: exams,
    assignmentDeadlines: assignmentDeadline,
    assignmentDescriptions: assignmentDescription,
    examDates: examsDate,
    examDescriptions: examDescription,
  );

  final box = Boxes.getData();
  box.add(data);
  await data.save();
}
