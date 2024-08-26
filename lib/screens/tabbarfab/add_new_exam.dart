import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class NewExams extends StatefulWidget {
  const NewExams({super.key, required this.model});
  final Model model;

  @override
  State<NewExams> createState() => _NewExamsState();
}

class _NewExamsState extends State<NewExams> {
  List<Widget> _wholeExamTextField = [];
  List<TextEditingController> _examControllers = [];
  List<TextEditingController> _examDateControllers = [];
  List<TextEditingController> _examDescriptionControllers = [];

  @override
  void initState() {
    super.initState();

    _examControllers.add(TextEditingController());
    _examDateControllers.add(TextEditingController());
    _examDescriptionControllers.add(TextEditingController());

    _wholeExamTextField.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _examControllers[0],
            decoration: InputDecoration(
              labelText: 'Exams',
              hintText: 'Exams',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );

    _wholeExamTextField.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _examDateControllers[0],
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Date',
              hintText: 'Date',
              border: OutlineInputBorder(),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                initialDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                _examDateControllers[0].text = formattedDate;
              }
            },
          ),
        ),
      ),
    );

    _wholeExamTextField.add(
      Container(
        height: 60,
        width: 200,
        child: TextFormField(
          controller: _examDescriptionControllers[0],
          decoration: InputDecoration(
            labelText: 'Description',
            hintText: 'Description',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  void _addExamTextFields() {
    setState(() {
      _examControllers.add(TextEditingController());
      _wholeExamTextField.add(
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Container(
            height: 60,
            width: 200,
            child: TextFormField(
              controller: _examControllers[_examControllers.length - 1],
              decoration: InputDecoration(
                labelText: 'Exams',
                hintText: 'Exams',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      );

      _examDateControllers.add(TextEditingController());
      _wholeExamTextField.add(
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            height: 60,
            width: 200,
            child: TextFormField(
              controller: _examDateControllers[_examDateControllers.length - 1],
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'Date',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                  _examDateControllers[_examDateControllers.length - 1].text = formattedDate;
                }
              },
            ),
          ),
        ),
      );

      _examDescriptionControllers.add(TextEditingController());
      _wholeExamTextField.add(
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            height: 60,
            width: 200,
            child: TextFormField(
              controller: _examDescriptionControllers[_examDescriptionControllers.length - 1],
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('New Exams'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Add Exams',
                style: TextStyle(fontSize: 25, color: Colors.green[900]),
              ),
            ),
            SizedBox(
              child: Column(
                children: _wholeExamTextField,
              ),
            ),
            ElevatedButton(
              onPressed: _addExamTextFields,
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 114, 202, 119),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                for (int i = 0; i < _examControllers.length; i++) {
                  if (_examControllers[i].text.isNotEmpty) {
                    widget.model.exams.add(_examControllers[i].text);
                  }
                  if (_examDateControllers[i].text.isNotEmpty) {
                    widget.model.examDates.add(_examDateControllers[i].text);
                  } else {
                    widget.model.examDates.add('');
                  }
                  if (_examDescriptionControllers[i].text.isNotEmpty) {
                    widget.model.examDescriptions.add(_examDescriptionControllers[i].text);
                  } else {
                    widget.model.examDescriptions.add('');
                  }
                }

                final data = Model(
                  subject: widget.model.subject,
                  duration: widget.model.duration,
                  subtopic: widget.model.subtopic,
                  links: widget.model.links,
                  images: widget.model.images,
                  assignments: widget.model.assignments,
                  exams: widget.model.exams,
                  assignmentDeadlines: widget.model.assignmentDeadlines,
                  assignmentDescriptions: widget.model.assignmentDescriptions,
                  examDates: widget.model.examDates,
                  examDescriptions: widget.model.examDescriptions,
                  subtopicChecked: widget.model.subtopicChecked,
                );

                final box = Boxes.getData();
                await box.put(widget.model.key, data);
                print(box);
                await data.save();

                Navigator.of(context).pop();
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 114, 202, 119),
              ),
            ),
          ],
        ),
      ),
    );
  }
}