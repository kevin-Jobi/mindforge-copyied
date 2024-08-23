  import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Text calculateDateDifference(String selectedDate) {
    final DateTime today = DateTime.now();
    final DateTime date = DateFormat('yyyy-MM-dd').parse(selectedDate);
    final Duration difference = date.difference(today);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${difference.inDays}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900], // Updated color
            ),
          ),
          TextSpan(
            text: ' days remaining',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.grey[800], // Updated color
            ),
          ),
        ],
      ),
    );
  }