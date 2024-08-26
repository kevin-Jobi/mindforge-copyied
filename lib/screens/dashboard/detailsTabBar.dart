import 'package:flutter/material.dart';

getTabBar(){
    TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.topic, color: Colors.red[800]), // Red color
              ),
              Tab(
                icon: Icon(Icons.image, color: Colors.red[700]), // Blue color
              ),
              Tab(
                icon: Icon(Icons.link, color: Colors.red[600]), // Green color
              ),
              Tab(
                icon: Icon(Icons.assignment, color: Colors.red[500]), // Purple color
              ),
              Tab(
                icon: Icon(Icons.local_activity, color: Colors.red[400]), // Teal color
              ),
            ],
          );
}