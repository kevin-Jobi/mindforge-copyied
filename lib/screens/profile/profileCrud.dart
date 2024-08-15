import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';


class MyProfileCrud extends StatefulWidget {
  const MyProfileCrud({super.key});

  @override
  State<MyProfileCrud> createState() => _MyProfileCrudState();
}

class _MyProfileCrudState extends State<MyProfileCrud> {
  TextEditingController nameConroller=TextEditingController();
  String profilename="";
  Uint8List? imageBytes;

   initState(){
     super.initState();
     final profile= Boxes.getData1().get('profile');
     if (profile !=null) {
      nameConroller.text= profile.name;
      imageBytes = profile.profileImg;
     }
   }

  Future<void> pickAndStoreImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      
      final bytes = await  File(pickedFile.path).readAsBytes();
      setState(() {
        imageBytes = bytes;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    
// nameConroller.text=Boxes.getData1().get("profile")!.name;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(28, 150, 28, 8),
        child: Container(
          height: 380,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 207, 205, 205),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                GestureDetector(
                  onTap: pickAndStoreImage,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      image: DecorationImage(
                        image: imageBytes == null
                            ? AssetImage('assets/images/Ellipse 1.png')
                            : MemoryImage(imageBytes!) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Add more widgets here for additional profile information
                SizedBox(height: 50,width: 250,
                 child: TextField(
                  controller: nameConroller,
                   decoration: InputDecoration(border: OutlineInputBorder()),
                   )),
                SizedBox(height: 20),
                
                    ElevatedButton(
                    onPressed: () async {
                      profilename = nameConroller.text;
                      print(profilename);
                      print(imageBytes);
                      if (profilename.isNotEmpty && imageBytes != null) {
                        final data =
                            Model1(name: profilename, profileImg: imageBytes!);
                        final box = Boxes.getData1();
                       
                          box.put('profile', data);
                        
                        print(box);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Profile saved successfully')));
                        print(data.name);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Enter a name and select an image')));
                      }
                     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyProfile()));
                     Navigator.of(context).pop();
                    },
                    child: Text("Submit"))


              ],
            ),
          ),
        ),
      ),
    );
  }
}