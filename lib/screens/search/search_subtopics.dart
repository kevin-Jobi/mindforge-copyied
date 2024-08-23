import 'package:flutter/material.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class SearchSubtopic extends StatefulWidget {
  const SearchSubtopic({super.key});

  @override
  State<SearchSubtopic> createState() => _SearchSubtopicState();
}

class _SearchSubtopicState extends State<SearchSubtopic> {
  List<String> subtopics = [];
  List<String> filteredSubtopics = [];

  getSubtopics() {
    final box = Boxes.getData();
    for (var model in box.values) {
      subtopics.addAll(model.subtopic);
    }
    setState(() {});
    return subtopics;
  }

  @override
  void initState() {
    super.initState();
    getSubtopics();
    filteredSubtopics = subtopics;
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredSubtopics = subtopics
          .where((element) =>
              element.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('Search Subtopics'),
        backgroundColor: Colors.orange[600], // Match the theme
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter search term',
                prefixIcon: Icon(Icons.search, color: Colors.orange[800]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                if (filteredSubtopics.isNotEmpty)
                  ListTile(
                    title: Text(
                      'Subtopics',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                  ),
                ...filteredSubtopics.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          e,
                          style: TextStyle(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        leading: Icon(
                          Icons.subtitles,
                          color: Colors.green[700], // Icon color example
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue[700], // Different color for the trailing icon
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
