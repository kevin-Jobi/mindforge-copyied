import 'package:flutter/material.dart';

class MyAssingments extends StatefulWidget {
  const MyAssingments({super.key});

  @override
  State<MyAssingments> createState() => _MyAssingmentsState();
}

class _MyAssingmentsState extends State<MyAssingments> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          
          child:AppBar(
            
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,28,0,0),
                  child: Text('Assignments',
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 186, 9, 9)
                    ),
                    ),
                )
                  ),
              backgroundColor: Color.fromARGB(255, 13, 227, 127),
              actions: [
            
                IconButton(onPressed: (){}, icon: Icon(Icons.search))
              ],
          ),
        )
      ],
    );
  }
}