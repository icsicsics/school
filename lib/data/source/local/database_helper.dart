import 'package:path/path.dart';
import 'package:schools/data/source/remote/model/parent_offline/parent_offline_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_offline/teacher_offline_response.dart';
import 'package:schools/data/source/remote/model/weather/weather_response.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "ejabi.db";
  static const _databaseVersion = 1;

  static const teacherOfflineData = 'teacher_offline_data';
  static const parentOfflineData = 'parent_offline_data';

  static const columnId = 'id';
  static const columnData = 'data';

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database.
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database and create the table if it doesn't exist.
  _initDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table.
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $teacherOfflineData (
        $columnId INTEGER PRIMARY KEY,
        $columnData TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE $parentOfflineData (
        $columnId INTEGER PRIMARY KEY,
        $columnData TEXT NOT NULL
      )
      ''');

  }

  Future<int> insertTeacherOfflineData(TeacherOfflineResponse teacherOfflineResponse) async {
    Database db = await database;
    Map<String, dynamic> row = {
      columnId: 1,
      columnData: teacherOfflineResponse.toJsonString(),
      // Convert to JSON string to store in the database.
    };
    return await db.insert(
      teacherOfflineData,
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<TeacherOfflineResponse> getTeacherOfflineData() async {
    Database db = await database;
    List<Map> maps = await db.query(teacherOfflineData);
    return TeacherOfflineResponse.fromJsonString(maps[0][columnData]);
  }


  Future<int> insertParentOfflineData(ParentOfflineResponse parentOfflineResponse) async {
    Database db = await database;
    Map<String, dynamic> row = {
      columnId: 1,
      columnData: parentOfflineResponse.toJsonString(),
      // Convert to JSON string to store in the database.
    };
    return await db.insert(
      parentOfflineData,
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<ParentOfflineResponse> getParentOfflineData() async {
    Database db = await database;
    List<Map> maps = await db.query(parentOfflineData);
    return ParentOfflineResponse.fromJsonString(maps[0][columnData]);
  }


}
