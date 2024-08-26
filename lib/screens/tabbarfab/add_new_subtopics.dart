import 'package:flutter/material.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class NewSubtopics extends StatefulWidget {
  const NewSubtopics({Key? key, required this.model}) : super(key: key);
  final Model model;

  @override
  State<NewSubtopics> createState() => _NewSubtopicsState();
}

class _NewSubtopicsState extends State<NewSubtopics> {
  List<Widget> _wholeSubtopicTextFields = [];
  List<TextEditingController> _subtopicControllers = [];

  @override
  void initState() {
    super.initState();
    _subtopicControllers.add(TextEditingController());
    widget.model.subtopicChecked.add(false);

    _wholeSubtopicTextFields.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _subtopicControllers[_subtopicControllers.length - 1],
            decoration: InputDecoration(
              labelText: 'Subtopic',
              hintText: 'Subtopic',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  void _addSubtopicTextField() {
    setState(() {
      _subtopicControllers.add(TextEditingController());
      _wholeSubtopicTextFields.add(
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Container(
            height: 60,
            width: 200,
            child: TextFormField(
              controller: _subtopicControllers[_subtopicControllers.length - 1],
              decoration: InputDecoration(
                labelText: 'Subtopic',
                hintText: 'Subtopic',
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
      backgroundColor: Colors.orange[100], // Background color
      appBar: AppBar(
        title: Text('New Subtopics'),
        backgroundColor: Colors.green[700], // AppBar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Add Subtopic',
                style: TextStyle(fontSize: 25, color: Colors.green[900]), // Text color
              ),
            ),
            SizedBox(
              child: Column(
                children: _wholeSubtopicTextFields,
              ),
            ),
            ElevatedButton(
              onPressed: _addSubtopicTextField,
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 114, 202, 119), // Button color
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                for (int i = 0; i < _subtopicControllers.length; i++) {
                  if (_subtopicControllers[i].text.isNotEmpty) {
                    widget.model.subtopic.add(_subtopicControllers[i].text);
                    widget.model.subtopicChecked.add(false);
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
                await data.save();

                Navigator.of(context).pop();
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 114, 202, 119), // Button color
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}