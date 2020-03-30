import 'dart:async';

import 'package:fluttering_plants/common/utils.dart';
import 'package:fluttering_plants/db/database.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:sqflite/sqflite.dart';

class PlantDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<Database> get db => dbProvider.database;

  Future<int> insert(Plant plant) async {
    var dbClient = await db;
    return await dbClient.insert(DB_NAME, plant.toJson());
  }

  Future<List<Plant>> getAll() async {
    var dbClient = await db;
    var map = await dbClient.query(DB_NAME);
    return List.generate(map.length, (i) => Plant.fromJson(map[i]));
  }

  Future<void> update(Plant plant) async {
    final dbClient = await db;
    await dbClient.update(
      DB_NAME,
      plant.toJson(),
      where: "id = ?",
      whereArgs: [plant.id],
    );
  }

  Future<int> delete(Plant plant) async {
    var dbClient = await db;
    return await dbClient.delete(DB_NAME);
  }

  Future<void> deleteById(int id) async {
    final dbClient = await db;
    await dbClient.delete(DB_NAME, where: "id = ?", whereArgs: [id]);
  }

  Future<Plant> find(int id) async {
    final dbClient = await db;
    var map = await dbClient.query(DB_NAME, where: "id = ?", whereArgs: [id]);
    return Plant.fromJson(map.first);
  }
}
