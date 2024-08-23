import 'package:flutter/material.dart';
import 'package:mind_forge/screens/dashboard/details.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> topics = [];
  List<String> filteredTopics = [];
  List<Model> models = [];

  getAllTopics() {
    final box = Boxes.getData();
    for (var model in box.values) {
      topics.add(model.subject);
      models.add(model);
    }
    return topics;
  }

  @override
  void initState() {
    super.initState();
    getAllTopics();
    filteredTopics = topics;
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredTopics = topics
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('Search Topics'),
        backgroundColor: Colors.orange[600], // Orange theme
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter search term',
                labelStyle: TextStyle(color: Colors.orange[900]), // Label color
                prefixIcon: Icon(Icons.search, color: Colors.orange[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.orange[300]!, width: 3.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.orange[600]!, width: 3.0),
                ),
              ),
              cursorColor: Colors.orange[600],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                if (filteredTopics.isNotEmpty) ...[
                  ListTile(
                    title: Text(
                      'Topics',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                  ),
                  ...filteredTopics.map((item) {
                    final model = models.firstWhere((model) => model.subject==item);
                        return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: GestureDetector(
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => MyDetails(
                                subject: model.subject,
                                 subTopics:model.subtopic,
                                  imageList:model.images,
                                   linkList:model.links,
                                    assignments:model.assignments,
                                    exams:model.exams,
                                    ModelKey:model.key,
                                    model:model))));
                        },
                      ),
                      tileColor: Colors.orange[200],
                    ),
                  );
                  }
               
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
