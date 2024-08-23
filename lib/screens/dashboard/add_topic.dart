import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mind_forge/screens/dashboard/image_picker_util.dart';
import 'package:mind_forge/screens/dashboard/addtopic_text_field_util.dart';

class AddTopic extends StatefulWidget {
  AddTopic({super.key, required this.subject, required this.duration});

  final String subject;
  final String duration;

  @override
  State<AddTopic> createState() => _AddTopicState();
}

class _AddTopicState extends State<AddTopic> {
  List<TextEditingController> _linkControllers = [];
  List<TextEditingController> _subtopicControllers = [];
  List<Widget> _linkTextFields = [];
  List<Widget> _subtopicTextFields = [];
  List<Uint8List> bytesList = [];

  @override
  void initState() {
    super.initState();

  initializeTextfields(_linkControllers,_linkTextFields,_subtopicControllers,_subtopicTextFields);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100], // Updated background color
      appBar: AppBar(
        title: Text(widget.subject),
        backgroundColor: Colors.orange[600], // Updated AppBar color
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ..._subtopicTextFields,
              ElevatedButton(
                onPressed: () {
                  addSubtopicTextField(
                    _subtopicControllers,
                    _subtopicTextFields,
                    setState,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 243, 128, 13), // Updated button color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Add Subtopic +'),
              ),
              SizedBox(height: 20),
              ..._linkTextFields,
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addLinkTextField(
                    _linkControllers,
                    _linkTextFields,
                    setState,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 243, 128, 13), // Updated button color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Add Link +'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green[900]!, width: 5.0),
                    image: DecorationImage(
                      image: bytesList.isNotEmpty
                          ? MemoryImage(bytesList.last)
                          : AssetImage('assets/images/Screenshot 2024-07-25 121548.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () async {
                  bytesList = await pickAndStoreImage();
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  handleNextButton(
                    context: context,
                    linkControllers: _linkControllers,
                    subtopicControllers: _subtopicControllers,
                    subject: widget.subject,
                    duration: widget.duration,
                    images: bytesList,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 243, 128, 13), // Updated button color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
