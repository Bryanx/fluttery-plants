import 'dart:async';
import 'dart:io';

import 'package:fluttering_plants/common/logging.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/repository/repository_provider.dart';
import 'package:mobx/mobx.dart';

part 'plant_list_store.g.dart';

///
/// Plant store that holds all plants in the database.
///
class PlantListStore = _PlantListStore with _$PlantListStore;

abstract class _PlantListStore with Store {
  @observable
  ObservableList<Plant> plants = ObservableList<Plant>();
  
  final plantRepo = RepositoryProvider.provider.plantRepo;

  @action
  Future add(Plant plant) async {
    await plantRepo.insert(plant);
    await fetch();
    log.d(logState(null, plants.last));
  }

  @action
  Future update(Plant plant) async {
    final prevPlant = findNullable(plant);
    await plantRepo.update(plant);
    await fetch();
    log.d(logState(prevPlant, findNullable(plant)));
  }

  @action
  Future fetch() async {
    await plantRepo
        .getAll()
        .then((result) => plants = ObservableList.of(result));
  }

  @action
  Future delete(Plant plant) async {
    if (!plant.imgPath.contains("sensevieria"))
      await File(plant.imgPath).delete();
    await plantRepo.deleteById(plant.id);
    await fetch();
    log.d(logState(plant, findNullable(plant)));
  }

  @action
  Future find(Plant plant) async {
    return await plantRepo.find(plant.id);
  }

  @action
  Plant findNullable(Plant plant) {
    return plants.firstWhere((p) => p.id == plant.id, orElse: () => null);
  }
}