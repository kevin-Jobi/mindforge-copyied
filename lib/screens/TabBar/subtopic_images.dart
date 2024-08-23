import 'package:flutter/material.dart';
import 'package:mind_forge/screens/dashboard/details.dart';
import 'package:mind_forge/screens/tabbar/image_view.dart';
import 'package:mind_forge/screens/tabbarfab/add_new_images.dart';

class SubtopicImages extends StatefulWidget {
  const SubtopicImages({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyDetails widget;

  @override
  _SubtopicImagesState createState() => _SubtopicImagesState();
}

class _SubtopicImagesState extends State<SubtopicImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100], // Updated background color
      appBar: AppBar(
        title: Text('Images'),
        backgroundColor: Colors.green[700], // Updated AppBar color
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4,
        ),
        itemCount: widget.widget.imageList.length,
        itemBuilder: (context, index) {
          var data = widget.widget.imageList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyImage(image: widget.widget.imageList[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: MemoryImage(data),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSubtopicImages(model: widget.widget.model),
            ),
          ).then((_) => setState(() {})); // Refresh the page when returning
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange[600], // Updated FloatingActionButton color
      ),
    );
  }
}
