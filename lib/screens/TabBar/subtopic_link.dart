import 'package:flutter/material.dart';
import 'package:mind_forge/screens/dashboard/details.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';
import 'package:url_launcher/url_launcher.dart';

class SubTopicLink extends StatefulWidget {
  const SubTopicLink({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyDetails widget;

  @override
  State<SubTopicLink> createState() => _SubTopicLinkState();
}

class _SubTopicLinkState extends State<SubTopicLink> {
  final TextEditingController _linkEditController = TextEditingController();
  String newLink = '';

  Future<void> _launchURL(String url) async {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'https://$url';
    }
    final Uri uri = Uri.parse(Uri.encodeFull(url.trim()));
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Could not launch $url')),
      );
    }
  }

  void _showAlertDialog(BuildContext context, int index, Model model) {
    _linkEditController.text = model.links[index];
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
                'Edit Link',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _linkEditController,
                    decoration: InputDecoration(
                      hintText: 'Link',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      newLink = _linkEditController.text;
                      if (_linkEditController.text.isNotEmpty) {
                        model.links[index] = newLink;
                        final box = Boxes.getData();
                        box.put(model.key, model);
                        setState(() {});
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill in the link'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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

  void deleteLink(Model model, String valueToRemove) async {
    model.links.remove(valueToRemove);
    await model.save();
    setState(() {});
  }

  void _addNewLink() {
    _linkEditController.clear();
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
                'Add New Link',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _linkEditController,
                    decoration: InputDecoration(
                      hintText: 'New Link',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_linkEditController.text.isNotEmpty) {
                        widget.widget.model.links.add(_linkEditController.text);
                        final box = Boxes.getData();
                        await box.put(widget.widget.model.key, widget.widget.model);
                        setState(() {});
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter a link'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100], // Updated background color
      appBar: AppBar(
        title: Text('Links'),
        backgroundColor: Colors.green[700], // Updated AppBar color
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.widget.model.links.length,
          itemBuilder: (context, index) {
            final linkData = widget.widget.model.links[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  linkData,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900],
                  ),
                ),
                onTap: () {
                  _launchURL(linkData);
                },
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'edit') {
                      _showAlertDialog(context, index, widget.widget.model);
                    } else if (value == 'delete') {
                      deleteLink(widget.widget.model, linkData);
                      setState(() {
                        
                      });
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
        onPressed: _addNewLink,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange[600], // Updated FloatingActionButton color
      ),
    );
  }
}
