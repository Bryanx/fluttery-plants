import 'dart:async';
import 'dart:io';

import 'package:fluttering_plants/db/test_data.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/utils/utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database db;

  Future<Database> get database async {
    if (db != null) return db;
    db = await createDatabase();
    return db;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "FlutteringPlants.db");

    var database = await openDatabase(path,
        version: 1,
        onCreate: initDB,
        onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database db, int version) async {
    await db.execute("CREATE TABLE $DB_NAME("
        "id INTEGER PRIMARY KEY, "
        "name TEXT, "
        "nick_name TEXT, "
        "img_path TEXT, "
        "water_start INTEGER, "
        "water_interval INTEGER, "
        "fertilizer_start INTEGER, "
        "fertilizer_interval INTEGER"
        ")"
    );
    await populateDb(db);
  }

  Future<void> populateDb(Database db) async {
    TestData.generateTestPlants()
        .map((plant) => plant.toJson())
        .forEach((plantJson) => db.insert(DB_NAME, plantJson));
  }
}
