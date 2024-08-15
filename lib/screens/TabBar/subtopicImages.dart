// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mind_forge/screens/dashboard/details.dart';
// import 'package:mind_forge/screens/dashboard/imageView.dart';

// class SubtopicImages extends StatelessWidget {
//   const SubtopicImages({
//     super.key,
//     required this.widget,
//   });

//   final MyDetails widget;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(                                             //2
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         crossAxisSpacing: 4.0,
//         mainAxisSpacing: 4
//       ),
//       itemCount:widget.imageList.length,
//       itemBuilder: (context,index){
//         var data=widget.imageList[index];
//         print( 'recived data is ${data}');
//         // return Container(height: 70, decoration: BoxDecoration(image: DecorationImage(image: FileImage(data),fit: BoxFit.cover)),);
//      return GestureDetector(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>MyImage(image:widget.imageList[index] )
//                   )
//                   );
//                 },
//                 child: Image.memory(
//                   data,fit: BoxFit.cover,
//                 ),
//               );
//       }
//       );
//   }
// }





import 'package:flutter/material.dart';
import 'package:mind_forge/screens/TabBarFAB/addNewImages.dart';
import 'package:mind_forge/screens/dashboard/details.dart';
import 'package:mind_forge/screens/TabBar/imageView.dart';

class SubtopicImages extends StatefulWidget { // Changed to StatefulWidget
  const SubtopicImages({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyDetails widget;

  @override
  _SubtopicImagesState createState() => _SubtopicImagesState();
}

class _SubtopicImagesState extends State<SubtopicImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Images'),
        backgroundColor: Colors.green[800],
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4
        ),
        itemCount: widget.widget.imageList.length,
        itemBuilder: (context, index) {
          var data = widget.widget.imageList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => MyImage(image: widget.widget.imageList[index])
              ));
            },
            child: Image.memory(
              data,
              fit: BoxFit.cover,
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSubtopicImages(model: widget.widget.model),
            ),
          ).then((_) => setState(() {})); // Refresh the page when returning
        },
        child: Icon(Icons.add),
      ),
    );
  }
}