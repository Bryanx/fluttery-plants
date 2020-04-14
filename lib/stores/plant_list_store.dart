import 'dart:async';
import 'dart:io';

import 'package:fluttering_plants/common/logging.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/repository/repository_provider.dart';
import 'package:mobx/mobx.dart';

part 'plant_list_store.g.dart';

class PlantListStore = _PlantListStore with _$PlantListStore;

abstract class _PlantListStore with Store {
  @observable
  ObservableList<Plant> plants = ObservableList<Plant>();

  @action
  Future add(Plant plant) async {
    await RepositoryProvider.provider.plantRepo.insert(plant);
    await fetch();
    log.d(logState(null, plants.last));
  }

  @action
  Future update(Plant plant) async {
    final prevPlant = findNullable(plant);
    await RepositoryProvider.provider.plantRepo.update(plant);
    await fetch();
    log.d(logState(prevPlant, findNullable(plant)));
  }

  @action
  Future fetch() async {
    await RepositoryProvider.provider.plantRepo
        .getAll()
        .then((result) => plants = ObservableList.of(result));
  }

  @action
  Future delete(Plant plant) async {
    if (!plant.imgPath.contains("sensevieria"))
      await File(plant.imgPath).delete();
    await RepositoryProvider.provider.plantRepo.deleteById(plant.id);
    await fetch();
    log.d(logState(plant, findNullable(plant)));
  }

  @action
  Future find(Plant plant) async {
    return await RepositoryProvider.provider.plantRepo.find(plant.id);
  }

  @action
  Plant findNullable(Plant plant) {
    return plants.firstWhere((p) => p.id == plant.id, orElse: () => null);
  }
}