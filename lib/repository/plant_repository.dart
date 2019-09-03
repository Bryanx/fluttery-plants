import 'package:fluttering_plants/db/plant_dao.dart';
import 'package:fluttering_plants/model/plant.dart';

/// Class for fetching data from db or web service
/// The logic for which to use should come here.
class PlantRepository {
  final dao = PlantDao();

  Future<List<Plant>> getAll() => dao.getAll();

  Future insert(Plant plant) => dao.insert(plant);

  Future update(Plant plant) => dao.update(plant);

  Future<Plant> find(int id) => dao.find(id);

  Future deleteById(int id) => dao.deleteById(id);

}
