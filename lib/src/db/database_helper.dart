import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper = DatabaseHelper._createInstance();

  final Future<Database> database = initDatabase();

  static Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(join(path, 'post_database.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE posts(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, dateTime TEXT, imagePath TEXT)",
      );
    });
  }

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    return _databaseHelper;
  }
}
