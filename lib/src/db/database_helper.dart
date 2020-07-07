import 'package:grow_plant/src/model/post.dart';
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

  Future<int> insertPost(Post post) async {
    final database = await this.database;
    var result = await database.insert('posts', post.toJson());
    return result;
  }

  Future<List<Post>> getPostList() async {
    final databae = await this.database;

    final List<Map<String, dynamic>> maps =
        await databae.query('posts', orderBy: 'id DESC');

    return List.generate(maps.length, (index) => Post.fromJson(maps[index]));
  }
}
