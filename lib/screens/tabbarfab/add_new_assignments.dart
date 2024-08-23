import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class NewAssignments extends StatefulWidget {
  const NewAssignments({super.key, required this.model, required this.context});
  final Model model;
  final BuildContext context;

  @override
  State<NewAssignments> createState() => _NewAssignmentsState();
}

class _NewAssignmentsState extends State<NewAssignments> {
  List<Widget> _wholeAssignmentTextFields = [];

  List<TextEditingController> _assignmentControllers = [];
  List<TextEditingController> _assignmentDeadlineControllers = [];
  List<TextEditingController> _assignmentDescriptionControllers = [];

  @override
  void initState() {
    super.initState();
    _assignmentControllers.add(TextEditingController());
    _assignmentDeadlineControllers.add(TextEditingController());
    _assignmentDescriptionControllers.add(TextEditingController());

    _wholeAssignmentTextFields.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _assignmentControllers[_assignmentControllers.length - 1],
            decoration: InputDecoration(
              labelText: 'Assignments',
              hintText: 'Assignments',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );

    _wholeAssignmentTextFields.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          height: 60,
          width: 200,
          child: TextFormField(
            controller: _assignmentDeadlineControllers[_assignmentDeadlineControllers.length - 1],
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Deadline',
              hintText: 'Deadline',
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
                _assignmentDeadlineControllers[_assignmentDeadlineControllers.length - 1].text = formattedDate;
              }
            },
          ),
        ),
      ),
    );

    _wholeAssignmentTextFields.add(
      Container(
        height: 60,
        width: 200,
        child: TextFormField(
          controller: _assignmentDescriptionControllers[_assignmentDescriptionControllers.length - 1],
          decoration: InputDecoration(
            labelText: 'Description',
            hintText: 'Description',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  void _addAssignmentTextFields() {
    setState(() {
      _assignmentControllers.add(TextEditingController());
      _wholeAssignmentTextFields.add(
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Container(
            height: 60,
            width: 200,
            child: TextFormField(
              controller: _assignmentControllers[_assignmentControllers.length - 1],
              decoration: InputDecoration(
                labelText: 'Assignments',
                hintText: 'Assignments',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      );
      _assignmentDeadlineControllers.add(TextEditingController());
      _wholeAssignmentTextFields.add(
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            height: 60,
            width: 200,
            child: TextFormField(
              controller: _assignmentDeadlineControllers[_assignmentDeadlineControllers.length - 1],
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Deadline',
                hintText: 'Deadline',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                  _assignmentDeadlineControllers[_assignmentDeadlineControllers.length - 1].text = formattedDate;
                }
              },
            ),
          ),
        ),
      );
      _assignmentDescriptionControllers.add(TextEditingController());
      _wholeAssignmentTextFields.add(
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            height: 60,
            width: 200,
            child: TextFormField(
              controller: _assignmentDescriptionControllers[_assignmentDescriptionControllers.length - 1],
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
      backgroundColor: Colors.orange[100], // Background color
      appBar: AppBar(
        title: Text('New Assignments'),
        backgroundColor: Colors.green[700], // AppBar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Add Assignment',
                style: TextStyle(fontSize: 25, color: Colors.green[900]), // Text color
              ),
            ),
            SizedBox(
              child: Column(
                children: _wholeAssignmentTextFields,
              ),
            ),
            ElevatedButton(
              onPressed: _addAssignmentTextFields,
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 114, 202, 119), // Button color
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                List<String> assignments = [];
                List<String> assignmentDeadline = [];
                List<String> assignmentDescription = [];

                assignments.addAll(widget.model.assignments );
                assignmentDeadline.addAll(widget.model.assignmentDeadlines !);
                assignmentDescription.addAll(widget.model.assignmentDescriptions );

                for (int i = 0; i < _assignmentControllers.length; i++) {
                  if (_assignmentControllers[i].text.isNotEmpty) {
                    assignments.add(_assignmentControllers[i].text);
                  }
                  if (_assignmentDeadlineControllers[i].text.isNotEmpty) {
                    assignmentDeadline.add(_assignmentDeadlineControllers[i].text);
                  } else {
                    assignmentDeadline.add('');
                  }
                  if (_assignmentDescriptionControllers[i].text.isNotEmpty) {
                    assignmentDescription.add(_assignmentDescriptionControllers[i].text);
                  } else {
                    assignmentDescription.add('');
                  }
                }

                final data = Model(
                  subject: widget.model.subject,
                  duration: widget.model.duration,
                  subtopic: widget.model.subtopic,
                  links: widget.model.links,
                  images: widget.model.images,
                  assignments: assignments,
                  exams: widget.model.exams,
                  assignmentDeadlines: assignmentDeadline,
                  assignmentDescriptions: assignmentDescription,
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
