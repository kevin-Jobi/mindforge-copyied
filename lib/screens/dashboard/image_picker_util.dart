import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<List<Uint8List>> pickAndStoreImage() async {
  List<Uint8List> bytesList = [];
  final picker = ImagePicker();
  final pickedFiles = await picker.pickMultiImage();
  
  if (pickedFiles.isNotEmpty) {
    for (var imageFile in pickedFiles) {
      final File file = File(imageFile.path);
      final bytes = file.readAsBytesSync();
      bytesList.add(bytes);
    }
    print('Added values: ${bytesList.length}');
  }
  return bytesList;
}