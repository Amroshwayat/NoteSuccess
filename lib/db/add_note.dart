import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUser{
static Database? _db;
Future<Database?> get db async{

  if(_db==null){
     _db=await inital();
    return _db;
  }else{
return _db;
  }
}



  inital()async{
String dataBasePath=await getDatabasesPath();
String path= join(dataBasePath,'Note.db');
Database db=await openDatabase(path,onCreate: _onCreate,version:1,onUpgrade: _onUpgrade);
return db;

  }
_onUpgrade(Database db,int old,int newVersion){
print("upgrade====================");
}
_onCreate(Database db,int version) async{
  await db.execute('''
create table "Notes" ( 
 "Id" integer primary key autoincrement, 
 "Title" text not null,
  "Des" integer not null)

  ''');
  print("Create DataBase Done=============");
}
redData(String sql)async{
  Database? mydb= await db;
 List<Map> res= await mydb!.rawQuery(sql);
 return res;


}
insertData(String sql)async{
  Database? mydb= await db;
 int res= await mydb!.rawInsert(sql);
 return res;


}
deleteData(String sql)async{
  Database? mydb= await db;
 int res= await mydb!.rawDelete(sql);
 return res;


}
updateData(String sql)async{
  Database? mydb= await db;
 int res= await mydb!.rawUpdate(sql);
 return res;


}

}