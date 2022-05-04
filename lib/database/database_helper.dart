import 'package:flutter_sqlite/database/my_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  String dbName = 'userbook.db';
  String tbName = 'books';
  final COLUMN_ID = 'id';
  final COLUMN_Name = 'name';
  final COLUMN_Address = 'address';
  final COLUMN_Phone = 'phone';

  static DatabaseHelper? databaseHelper;
  DatabaseHelper._create();
  Database? _database;

//Todo Check Database
  factory DatabaseHelper() {
    if (databaseHelper == null) {
      databaseHelper = DatabaseHelper._create();
    }
    return databaseHelper!;
  }
  Future<Database> getDatabase() async {
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database!;
  }

//todo  Delete List item
  Future<Database> delSaveData(int? id) async {
    return _database!;
  }

//todo delete all Data
  Future<Database> clearAllData() async {
    return _database!;
  }

  Future<Database> initDatabase() async {
    //Todo if assets file database #Code => getApplicationDocumentsDirectory();
    var directory = await getDatabasesPath();
    var db = join(directory, dbName);
    return openDatabase(db, version: 1, onCreate: _create);
  }

//Todo create DataBase
  Future<void> _create(Database database, version) async {
    String sql =
        'CREATE TABLE $tbName($COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,$COLUMN_Name CHAR,$COLUMN_Address CHAR,$COLUMN_Phone CHAR)';
    database.execute(sql);
  }

  //Todo Save Data
  Future<int> save(MyDatabase testDatabase) async {
    Database db = await getDatabase();
    return db.insert(tbName, testDatabase.toMap());
  }

//Todo Get Data
  Future<List<MyDatabase>> getAllData() async {
    Database db = await getDatabase();
    var footballMap = await db.query(tbName);
    List<MyDatabase> dataList =
        footballMap.map((e) => MyDatabase.fromMap(e)).toList();
    return dataList;
  }
}
