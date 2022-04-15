import 'package:sqflite/sqflite.dart';
import 'package:restaurant_apps/data/model/restaurant.dart';

class DatabaseHelper {
  static DatabaseHelper _instance;
  static Database _database;
  static const String _tableRestaurant = 'restaurant';

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurant_apps.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tableRestaurant (
          id TEXT PRIMARY KEY,
          name TEXT,
          description TEXT,
          pictureId TEXT,
          city TEXT,
          rating DOUBLE
        )''');
      },
      version: 1,
    );
    return db;
  }

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<void> insertRestaurant(RestaurantElement restaurant) async {
    final db = await database;
    await db.insert(_tableRestaurant, restaurant.toJson());
  }

  Future<void> removeRestaurant(String id) async {
    final db = await database;

    await db.delete(
      _tableRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<RestaurantElement>> getAllRestaurant() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableRestaurant);

    return results.map((res) => RestaurantElement.fromJson(res)).toList();
  }

  Future<Map> getRestaurantById(String id) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    }
    return {};
  }
}
