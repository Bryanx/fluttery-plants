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
//    await Future.delayed(Duration(seconds: 2));  //TODO: LOADER
    await RepositoryProvider.provider.plantRepo.insert(plant);
    await fetch();
  }

  @action
  Future update(Plant plant) async {
    await RepositoryProvider.provider.plantRepo.update(plant);
    await fetch();
  }

  @action
  Future fetch() async {
//    await Future.delayed(Duration(seconds: 2)); //TODO: LOADER + SHOW ANIMATION
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
  }

  @action
  Future find(Plant plant) async {
    return await RepositoryProvider.provider.plantRepo.find(plant.id);
  }
}