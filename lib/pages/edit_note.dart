
import 'package:flutter/material.dart';
import 'package:noteapp1/db/add_note.dart';
import 'package:noteapp1/pages/home.dart';

class EditNote extends StatefulWidget {
 final tit ;
  final sub;
  final id;

  const EditNote({required this.tit,required this.sub,required this.id});
  
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
 
 @override
  void initState() {
    // TODO: implement initState
    title.text=widget.tit;
    descreption.text=widget.sub;
    
    super.initState();
  }
    TextEditingController title= TextEditingController();
   TextEditingController descreption= TextEditingController();
   DatabaseUser sd=new DatabaseUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Note"),actions: [IconButton(onPressed: () async{
        
 int ins=  await  sd.updateData('''UPDATE Notes SET 
                           Title="${title.text}",
                            Des="${descreption.text}"
                              WHERE Id=${widget.id} ''');
           if(ins>0){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (cont){
      return HomePage();
        }), (route) => false);
           }

setState(() {
  
});

      }, icon: Icon(Icons.check))],),
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
          
        ]),
      ),

    );
  }
}