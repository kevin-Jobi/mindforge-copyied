import 'package:flutter/material.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class MyExams extends StatefulWidget {
  const MyExams({super.key});

  @override
  State<MyExams> createState() => _MyExamsState();
}

class _MyExamsState extends State<MyExams> {
   List <String> getAllExams(){
    List <String> allExams=[];
    final box =Boxes.getData();
    for(var model in box.values){
      allExams.addAll(model.exams);
    }
    return allExams;
  }
  @override
  Widget build(BuildContext context) {
    List<String> exams=getAllExams();
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams'),
      ),
        body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: ((context, index) {
        return ListTile(
          title: Text(
            exams[index],
            style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
          ),
        
        );
      })),
    );
  }
}