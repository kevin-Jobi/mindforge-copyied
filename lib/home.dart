import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:mind_forge/addTopic.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _textFieldController=TextEditingController();

  void _showAlertDialog(BuildContext context){                     // alertdialog start
    showDialog(context: context, builder: (BuildContext context){
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            content: Column(
              children: [
                Container(
                  width: 150,
                  child: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      hintText: 'Subject',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                 Container(
                  width: 150,
                   child: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      hintText: 'Duration',
                      border: OutlineInputBorder()
                    ),
                                   ),
                 ),
                 SizedBox(height: 15,),

                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 150,
                    color: Colors.blue,
                  ),
                  onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTopic()));} ,
                )

              ],
            ),
            
          ),
        ),
      );
    });
  }                                                   //alertdialoge end

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ),
          child: AppBar(
            
              title: Center(
                child: Text('TOPICS',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                  ),
                  )
                  ),
              backgroundColor: Color.fromARGB(255, 5, 238, 129),
              actions: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10),
                //   child: Container(
                //     width: 86,
                //     height: 35,
                //     child: TextField(
                //       decoration: InputDecoration(
                //         hintText: 'Search..',
                //         filled: true,
                //         fillColor: Colors.white,
                //         contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(20)),
                //           borderSide: BorderSide.none
                //           ),
                          
                //       ),
                //     ),
                //   )
                //   )
                IconButton(onPressed: (){}, icon: Icon(Icons.search))
              ],
          ),
        ),
        floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 100,
            height: 100,
            child: FloatingActionButton(
              onPressed: ()async{
            _showAlertDialog(context);
            var box= await Hive.openBox('kevin');
            },
            backgroundColor: Color.fromARGB(255, 93, 169, 231), 
            shape: CircleBorder(),
            child: Text(
              'Add\nTopic',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            )
            ),
          ),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Folder'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
              )
        ]),
      ),
    );
  }
}