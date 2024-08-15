// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mind_forge/screens/dashboard/details.dart';
// import 'package:mind_forge/services/models/model.dart';
// import 'package:mind_forge/services/repos/boxes.dart';
// class Subtopics extends StatefulWidget {
//   const Subtopics({super.key,required this.widget});

//   final MyDetails widget;

//   @override
//   State<Subtopics> createState() => _SubtopicsState();
// }

// class _SubtopicsState extends State<Subtopics> {
//     final TextEditingController _subTopicEditController = TextEditingController();
//   String newSubTopic = '';

//     void _showAlertDialog(BuildContext context, int index, Model model) {
//     _subTopicEditController.text = model.subtopic[index]; // Pre-fill with current assignment

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Center(
//           child: SingleChildScrollView(
//             child: AlertDialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               title: Text(
//                 'Edit Subtopic',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green[900],
//                 ),
//               ),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: _subTopicEditController,
//                     decoration: InputDecoration(
//                       hintText: 'Subtopic',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 114, 202, 119), // Button color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () {
//                       newSubTopic = _subTopicEditController.text;
//                       if (_subTopicEditController.text.isNotEmpty) {
//                         model.subtopic[index] = newSubTopic;
//                         final box = Boxes.getData();
//                         box.put(model.key, model);
//                         setState(() {});
//                         Navigator.of(context).pop();
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Please fill in the subtopic'),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                       }
//                     },
//                     child: Text('Save'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//     void deleteSubtopic(Model model, String valuetoRemove) async {
//       print('It is not deleted');
//     model.subtopic.remove(valuetoRemove);
//     await model.save();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[100],
//         appBar: AppBar(
//         title: Text('Subtopics'),
//         backgroundColor: Colors.green[800],
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount:widget.widget.subTopics.length,
//       itemBuilder: (context,index){
//         var subtopicData=widget.widget.subTopics[index];
//         print( 'recived data is ${subtopicData}');
//         return Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)
//           ),
//           child: ListTile(
//             title: Text(
//               subtopicData,
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color: Colors.green[900]
//               ),
//               ),
//               onTap: (){
//                 _showAlertDialog(context, index, widget.widget.model);
//               },
//               trailing: PopupMenuButton(
//                 onSelected: (value){
//                   if(value == 'edit'){
//                     _showAlertDialog(context, index, widget.widget.model);
//                   } else if (value == 'delete') {
//                     deleteSubtopic(widget.widget.model, subtopicData);
//                   }
//                 },
//                 itemBuilder: (context) => [
//                   PopupMenuItem(
//                     value: 'edit',
//                     child: ListTile(
//                     leading: Icon(Icons.edit,color: Colors.green[800],),
//                     title: Text('Edit'),
//                   )
//                   ),
//                   PopupMenuItem(
//                     value: 'delete',
//                     child: ListTile(
//                     leading: Icon(Icons.delete,color: Colors.red),
//                     title: Text('Delete'),
//                   ))
//               ]),
//               ),
//         );
//       }
//       )
//         ,)

//     );


//   }
// }



import 'package:flutter/material.dart';
import 'package:mind_forge/screens/TabBarFAB/addNewSubtopics.dart';
import 'package:mind_forge/screens/dashboard/details.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class Subtopics extends StatefulWidget {
  final MyDetails widget;
  final Model model;

  const Subtopics({Key? key, required this.widget, required this.model}) : super(key: key);

  @override
  State<Subtopics> createState() => _SubtopicsState();
}

class _SubtopicsState extends State<Subtopics> {
  final TextEditingController _subTopicEditController = TextEditingController();
  String newSubTopic = '';

  void _showAlertDialog(BuildContext context, int index, Model model) {
    _subTopicEditController.text = model.subtopic[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                'Edit Subtopic',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _subTopicEditController,
                    decoration: InputDecoration(
                      hintText: 'Subtopic',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 114, 202, 119),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      newSubTopic = _subTopicEditController.text;
                      if (_subTopicEditController.text.isNotEmpty) {
                        model.subtopic[index] = newSubTopic;
                        final box = Boxes.getData();
                        box.put(model.key, model);
                        setState(() {});
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill in the subtopic'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSubtopicDetails(BuildContext context, int index, Model model) {
    String subtopicName = model.subtopic[index];
    // You can add more details here if needed, similar to assignments

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                subtopicName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Add more details here if needed
                  Text('Subtopic details can be added here.'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void deleteSubtopic(Model model, String valueToRemove) async {
    model.subtopic.remove(valueToRemove);
    await model.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Subtopics'),
        backgroundColor: Colors.green[800],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.model.subtopic.length,
          itemBuilder: (context, index) {
            var subtopicData = widget.model.subtopic[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  subtopicData,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900],
                  ),
                ),
                onTap: () {
                  _showSubtopicDetails(context, index, widget.model);
                },
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'edit') {
                      _showAlertDialog(context, index, widget.model);
                    } else if (value == 'delete') {
                      deleteSubtopic(widget.model, subtopicData);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: ListTile(
                        leading: Icon(Icons.edit, color: Colors.green[800]),
                        title: Text('Edit'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: ListTile(
                        leading: Icon(Icons.delete, color: Colors.red),
                        title: Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add new subtopic page
          // You'll need to create a NewSubtopics widget similar to NewAssignments
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewSubtopics(model: widget.model))).then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}