import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noteapp1/db/add_note.dart';
import 'package:noteapp1/pages/add_note.dart';
import 'package:noteapp1/pages/edit_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List color=[Colors.red,Colors.yellow,Colors.green,Colors.yellow,Colors.orange,Colors.pink];
Random random = new Random();
 
  bool isLoding= true;
  List note=[];
  DatabaseUser db1 = DatabaseUser();
  Future readData() async {
    List<Map> res = await db1.redData("SELECT * FROM Notes");
    note.addAll(res);
    isLoding=false;
    if(mounted){
    setState(() {
      
    });}
  }
  @override
  void initState() {
    // TODO: implement initState
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AddNote(),
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Notes"),
        ),
        body:isLoding?Center(child: Text("loding........")): ListView(
          children: [
    
              ListView.builder(
                    itemCount: note.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: color[random.nextInt(5)]  ),
                            child: ListTile(
                              
                                title: Text(note[index]['Title']),
                                subtitle: Text(note[index]['Des']),
                                trailing: Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [IconButton(onPressed: () async{
                                   
                                     
                                                        Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder: (BuildContext context) =>  EditNote (
                                                       
                                tit: note[index] ['Title'],
                                
                                id:  note[index]['Id'] ,
                                sub:  note[index]['Des'],
                                                
                                                ),
                                              ),
                                            ); 
                                    
                                                              
                                  },icon: Icon(Icons.edit),),IconButton(onPressed: () async{
                                   
                                      int v= await db1.deleteData("DELETE FROM Notes WHERE Id=${note[index]['Id']} ");
                                       if(v>0){
                                      
                                        setState(() {
                                          
                                            note.removeWhere((element) => element['Id']==note[index]['Id']);
                                        });
                                       }
                                    
                                                              
                                  },icon: Icon(Icons.delete),)],),
                                ))),
                      );
                    },
                  )
          
          ],
        ));
  }
}
