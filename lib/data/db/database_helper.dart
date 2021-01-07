import 'package:dicoding_fundamtental_submission/data/models/favorite_restaurant.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  DatabaseHelper._createObject();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createObject();
    }
    return _databaseHelper;
  }
  static const String _tblFavorite = 'favorite';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/dicodingfindresto.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblFavorite (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            city TEXT,
            address TEXT,
            pictureId TEXT,
            rating REAL
          )     
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }
    return _database;
  }

  Future<List<Favorite>> getDataFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tblFavorite);

    return results.map((e) => Favorite.fromJson(e)).toList();
  }

  Future<void> insertData(Favorite favorite) async {
    final db = await database;
    await db.insert(_tblFavorite, favorite.toJson());
  }

  Future<Map> getFavoriteDataById(String id) async {
    final db = await database;
    List<Map<String, dynamic>> results =
        await db.query(_tblFavorite, where: 'id=?', whereArgs: [id]);
    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeDataFavorite(String id) async {
    final db = await database;
    await db.delete(_tblFavorite, where: 'id=?', whereArgs: [id]);
  }
}
