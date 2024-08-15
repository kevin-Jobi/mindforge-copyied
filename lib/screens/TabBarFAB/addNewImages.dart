import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class AddSubtopicImages extends StatefulWidget {
  const AddSubtopicImages({Key? key, required this.model}) : super(key: key);
  final Model model;

  @override
  State<AddSubtopicImages> createState() => _AddSubtopicImagesState();
}

class _AddSubtopicImagesState extends State<AddSubtopicImages> {
  List<Uint8List> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _selectedImages.add(bytes);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Images'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.memory(
                      _selectedImages[index],
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.red),
                        onPressed: () => _removeImage(index),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Add Image'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              widget.model.images.addAll(_selectedImages);

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
              );

              final box = Boxes.getData();
              await box.put(widget.model.key, data);
              await data.save();

              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}