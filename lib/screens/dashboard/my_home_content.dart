import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_forge/screens/dashboard/add_topic.dart';
import 'package:mind_forge/screens/dashboard/details.dart';
import 'package:mind_forge/screens/dashboard/home_show_alert_dialog.dart';
import 'package:mind_forge/screens/dashboard/my_home_date.dart';
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100], // Updated background color
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
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
                          ),
                        );
                      },
                      onLongPress: () {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(100, 100, 0, 0),
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                              value: 'edit',
                              child: ListTile(
                                leading: Icon(Icons.edit, color: Colors.green[700]), // Updated color
                                title: Text('Edit'),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: ListTile(
                                leading: Icon(Icons.delete, color: Colors.red[600]), // Consistent color
                                title: Text('Delete'),
                              ),
                            ),
                          ],
                        ).then((value) {
                          if (value == 'edit') {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddTopic(
                                  subject: data[index].subject,
                                  duration: data[index].duration,
                                ),
                              ),
                            );
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
                          color: Colors.orange[100], // Updated color
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
                                      color: Colors.orange[300], // Updated color
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        data[index].subject,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey[900], // Updated color
                                        ),
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
                                      color: Colors.orange[200], // Updated color
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,25),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                onPressed: () async {
                  showAlertDialog(context, _subjectController, _durationController);
                },
                backgroundColor: Colors.deepOrange[600], // Consistent button color
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
      ),
    );
  }
}
