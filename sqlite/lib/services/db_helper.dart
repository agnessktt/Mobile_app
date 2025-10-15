import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  // tạo cột cho bảng
  final String studentTable = "student_table";
  final String sId = "id";
  final String sName = "name";
  final String sAge = "age";

  // create database
  Future<Database?> get db async {
    _db ??= await _initDb();
    return _db;
  }

  Future<Database?> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "student.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE $studentTable ($sId INTEGER PRIMARY KEY AUTOINCREMENT, $sName TEXT, $sAge INTEGER)");
      },
    );
  }

  // Lấy danh sách map
  Future<List<Map<String, dynamic>>> getStudentMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(studentTable);
    return result;
  }

  // insert
  Future<int> insertStudent(Map<String, dynamic> student) async {
    Database? db = await this.db;
    final int result = await db!.insert(studentTable, student);
    return result;
  }

  // update
  Future<int> updateStudent(Map<String, dynamic> student) async {
    Database? db = await this.db;
    final int result = await db!.update(studentTable, student,
        where: "$sId=?", whereArgs: [student[sId]]);
    return result;
  }

  // delete
  Future<int> deleteStudent(int id) async {
    Database? db = await this.db;
    final int result =
    await db!.delete(studentTable, where: "$sId=?", whereArgs: [id]);
    return result;
  }
}