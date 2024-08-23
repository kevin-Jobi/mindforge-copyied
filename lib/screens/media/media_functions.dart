 import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mind_forge/services/repos/boxes.dart';
import 'package:url_launcher/url_launcher.dart';

Future<List<Uint8List>> getAllImages() async {
    await Future.delayed(Duration(seconds: 1));
    List<Uint8List> allImages = [];
    final box = Boxes.getData();
    for (var model in box.values) {
      allImages.addAll(model.images);
    }
    return allImages;
  }


  Future<void> launchURL(String url,context) async {
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