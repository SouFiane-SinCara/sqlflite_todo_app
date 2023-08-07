import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  static Database? _db;
  Future<Database?> get getDb async {
    if (_db == null) {
      _db = await instance();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database?> instance() async {
    String pathgetter = await getDatabasesPath();
    String path = join(pathgetter, "todos.db");
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE 'TODOS' (
            "id" INTEGER PRIMARY KEY AUTOINCREMENT,
            "title" TEXT,
            "description" TEXT
            )''');
      },
    );
    return db;
  }

  Future<List<Map>> getData() async {
    Database? db = await getDb;
    List<Map> list = await db!.query("TODOS");
    return list;
  }

  Future<int> add({required Map<String, dynamic> data}) async {
    Database? db = await getDb;
    int response = await db!.insert("TODOS", data);
    return response;
  }

  Future<int> deleteElement({required int id}) async {
    Database? db = await getDb;
    int response = await db!.rawDelete("DELETE FROM 'TODOS' WHERE id = $id");
    return response;
  }

  Future<int> editElement(
      {required int id, required Map<String, dynamic> newData}) async {
    Database? db = await getDb;
    int response = await db!.update("TODOS", newData, where: "id = $id");
    return response;
  }
}
