import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mind_forge/screens/dashboard/addTopic.dart';
import 'package:mind_forge/screens/dashboard/details.dart';
import 'package:mind_forge/screens/dashboard/home_show_alert_dialog.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class MyHomeContent extends StatefulWidget {
  const MyHomeContent({Key? key}) : super(key: key);

  @override
  State<MyHomeContent> createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();


  void delete(Model model) async {
    await model.delete();
    setState(() {});
  }
  Text calculateDateDifference(String selectedDate){
    final DateTime today = DateTime.now();
    final DateTime date = DateFormat('yyyy-MM-dd').parse(selectedDate);
    final Duration difference = date.difference(today);
    // return '${difference.inDays} days remaining';
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${difference.inDays}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          ),
          TextSpan(
            text: 'days remaning',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            )
          )

        ]
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<Box<Model>>(
              valueListenable: Boxes.getData().listenable(),
              builder: (context, box, _) {
                var data = box.values.toList().cast<Model>();
                
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyDetails(
                            subject: data[index].subject,
                            subTopics: data[index].subtopic,
                            imageList: data[index].images,
                            linkList: data[index].links,
                            assignments: data[index].assignments,
                            exams: data[index].exams,
                            ModelKey: data[index].key,
                            model: data[index],
                          ),
                        ));
                      },
                      onLongPress: () {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(100, 100, 0, 0),
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                              value: 'edit',
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ),
                            ),
                          ],
                        ).then((value) {
                          if (value == 'edit') {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddTopic(
                                subject: data[index].subject,
                                duration: data[index].duration,
                              ),
                            ));
                          } else if (value == 'delete') {
                            delete(data[index]);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 5, 18, 1),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.green[100],
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: 75,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        data[index].subject,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 75,
                                    decoration: BoxDecoration(
                                      color: Colors.green[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      
                                        child: calculateDateDifference(data[index].duration),
                                        
                                      
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 80,
            height: 80,
            child: FloatingActionButton(
              onPressed: () async {
                // _showAlertDialog(context);
                                showAlertDialog(context, _subjectController, _durationController); // Use the new function

              },
              backgroundColor: Color.fromARGB(255, 216, 197, 27),
              shape: CircleBorder(),
              child: Text(
                'Add\nTopic',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}










