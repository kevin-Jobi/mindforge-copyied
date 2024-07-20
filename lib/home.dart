import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mind_forge/addTopic.dart';
import 'package:mind_forge/boxes.dart';
import 'package:mind_forge/model.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _subjectController=TextEditingController();
  final TextEditingController _durationController =TextEditingController();
  List<String>subject=[];
  List<String>duration=[];

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
                    controller: _subjectController,
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
                    controller: _durationController,
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
                  onTap:(){
                    final data= Model(subject: _subjectController.text,duration: _durationController.text);
                     
                   // subject.add(_subjectController.text);   
                  //duration.add(_durationController.text);
                  final box= Boxes.getData();
                  box.add(data);
                  data.save();
                  _subjectController.clear();
                  _durationController.clear();
                  print(box);
                    //  setState(() {
                       
                    //  });
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTopic(subject: _subjectController.text)));
                  // setState(() {
                    
                  // });
                  } 
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
          preferredSize: Size.fromHeight(85                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ),
          child: AppBar(
            
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,28,0,0),
                  child: Text('TOPICS',
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    ),
                    ),
                )
                  ),
              backgroundColor: Colors.green,
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
        body: 
      //  SizedBox(height: 30,),
        ValueListenableBuilder<Box<Model>>(
          valueListenable: Boxes.getData().listenable(),
         builder: (context,box,_){
          var data = box.values.toList().cast<Model>();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTopic( subject: data[index].subject)));
          },
          onLongPress: (){
            showMenu(
              context: context,
               position: RelativeRect.fromLTRB(100, 100, 0, 0),
                items: <PopupMenuEntry>[
                  PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),

                  )
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),

                  )
                  ),

                ]
                ).then((value) {
                  if(value=='edit'){

                    
                  }else if (value == 'delete'){

                  }
                });
          },

            // child: Padding(

            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     child: ListTile(
            //      // title: Text(subject[index]),
            //      title: Text(data[index].subject.toString()),
            //       //trailing: Text(duration[index]),
            //       trailing: Text(data[index].duration.toString()),
            //       tileColor: Colors.green,
            //     ),
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18,5,18,1),
              child: Container(
                
                height: 50,
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 3,
                      child: Container(
                        height: 75,
                         width: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 5, 238, 129),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                       
                        child: Center(child: Text(data[index].subject.toString(),
                        style:TextStyle(fontSize: 20) ,)),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                        flex: 1,
                      child: Container(
                        height: 75,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 5, 238, 129),
                        borderRadius: BorderRadius.circular(10)
                      ),
                        child: Center(child: Text(data[index].duration.toString(),
                        style:TextStyle(fontSize: 20))),
                      ),
                    )
                
                  ],
                ),
              ),
            ),
          );
          
        }
        )
        );
         }
         ),
        floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [

          Container(                                       //floating action button start
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
          ),                                            //fab ends
          
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