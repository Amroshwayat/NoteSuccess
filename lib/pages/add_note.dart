import 'package:flutter/material.dart';
import 'package:noteapp1/db/add_note.dart';
import 'package:noteapp1/pages/home.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController title= TextEditingController();
   TextEditingController descreption= TextEditingController();
   DatabaseUser sd=new DatabaseUser();
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
       SizedBox(height: 20,),
          TextFormField(
            
            controller:title,
            decoration: InputDecoration(label: Text("Title"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
           
      
          ),
          SizedBox(height: 20,),
      
          TextFormField(
            controller:descreption,
               decoration: InputDecoration(label:Text("Descreption"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
           maxLines: 5,
      
          ),
           SizedBox(height: 20,),
          Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(50),onTap: ()async{
              
                    int ins=  await  sd.insertData('''INSERT INTO Notes (Title,DES)
            VALUES ("${title.text}","${descreption.text}")      ''');
           if(ins>0){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (cont){
      return HomePage();
        }), (route) => false);
           }
              
            },child: Container(color: Color.fromARGB(255, 79, 79, 79),height: 50,width: 100,child: Center(child: Text("Add")))),
          )
        ]),
      ),

    );
  }
}