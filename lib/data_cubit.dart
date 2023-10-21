import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:statemangement/task_model.dart';

import 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  late Database db;

  void createDatabase() async {
    try {
      db = await openDatabase('Todoapp.db', version: 1,
          onCreate: (Database db, int version) {
        db.execute('''CREATE TABLE Tasks(
          id INTEGER PRIMARY KEY,
          title TEXT,
          note TEXT,
          date TEXT)''');
      },
      onOpen: (db){
      },

    );
     // getFromDB();
      //updateDB(id: 1,title: 'Dart');
     // deleteFromDB(2);
      insetToDB(title: 'Nora',note: 'Dart',date: '8/8');
      print('DB Created');
    } catch (e) {
      print(e.toString());
    }
  }

  void insetToDB({
    required String title,
    required String note,
    required String date,
  }) async {
    await db.rawInsert(
        '''INSERT INTO Tasks (title,note,date) VALUES ($title,$note,$date)
    ''').then((value) {
      print('DB Inserted Successfully + $value');
    });
  }

  void getFromDB()async{
 List<Map<String,Object?>> data= await db.rawQuery('''
 SELECT * FROM Tasks
 ''');
 print('Get From Database');
 List<TaskModel>taskList =data.map(( e) => TaskModel.fromJson(e)).toList();
 print(taskList[0].title);
 print(data);
  }





  void updateDB({required String title,required int id})async{
   await db.rawUpdate('''
    Update Tasks set title = ? where id =?
    ''',[title,id]);
   getFromDB();
  }

  void deleteFromDB(id)async{
   await db.rawDelete('''
   DELETE FROM Tasks where id = ?
   ''',[id]).then((value) {
     print('item Deleted Successfully+ $value ');
   });
   getFromDB();
  }
}
