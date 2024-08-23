import 'dart:typed_data';

import 'package:hive/hive.dart';

 part 'model.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject{
  @HiveField(0)
  String subject;
  @HiveField(1)
  String duration;
  @HiveField(2) 
  List<String> subtopic=[];
  @HiveField(3)
  List<String>links=[];
  @HiveField(4)
  List<Uint8List>images=[];
  @HiveField(5)
  List<String>assignments=[];
  @HiveField(6)
  List<String>exams=[];
  @HiveField(7)
  List<String>?assignmentDeadlines=[];
  @HiveField(8)
  List<String>assignmentDescriptions=[];
  @HiveField(9)
  List<String>examDates=[];
  @HiveField(10)
  List<String>examDescriptions=[];
  @HiveField(11)
  List<bool> subtopicChecked=[];

  

  Model({required this.subject, required this.duration,required this.subtopic,required this.links,required this.images,required this.assignments,required this.exams,required this.assignmentDeadlines, required this.assignmentDescriptions, required this.examDates, required this.examDescriptions,required this.subtopicChecked });
}

@HiveType(typeId: 1)
class Model1 extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  Uint8List profileImg;
  Model1({required this.name,required this.profileImg});
}