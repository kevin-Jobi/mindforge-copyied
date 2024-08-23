import 'package:flutter/material.dart';
import 'package:mind_forge/screens/media/mediaImages.dart';
import 'package:mind_forge/screens/media/mediaLinks.dart';

class Media extends StatelessWidget {
  const Media({super.key});

  Widget _buildMediaItem(BuildContext context, String title, VoidCallback onTap) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.orange[100], // Updated color
            child: Container(
              padding: EdgeInsets.all(10),
              height: 100, // Adjust height for grid items
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.orange[300]!, // Updated border color
                  width: 5.0, // Increased border width
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900], // Updated text color
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100], 
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text('Media'),
          backgroundColor: Colors.orange[600], // Orange theme
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMediaItem(
                context, 
                'Images', 
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MediaImages()),
                  );
                },
              ),
              _buildMediaItem(
                context, 
                'Links', 
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MediaLinks()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
