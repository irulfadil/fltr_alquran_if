import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  static const _databaseName = 'mybookmark.db';
  static const _databaseVersion = 1;

  DatabaseInstance._();
  static final DatabaseInstance instance = DatabaseInstance._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // ignore: avoid_print
    print("directory****: ${documentsDirectory.path}");
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE bookmark(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            surah TEXT NOT NULL,
            ayah INTEGERT NOT NULL,
            juz INTEGERT NOT NULL,
            via TEXT NOT NULL,
            index_ayah TEXT NOT NULL,
            last_read INTEGER DEFAULT 0
          )
        ''');
  }

  /// via: by surah or juz.
  /// index_ayah: use autoscroll.

  Future closeDB() async {
    _database = await instance.database;
    _database?.close();
  }
}
