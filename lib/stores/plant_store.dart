import 'dart:io';

import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/repository/repository_provider.dart';
import 'package:mobx/mobx.dart';

part 'plant_store.g.dart';

class PlantStore = _PlantStore with _$PlantStore;

const msPerDay = 86400000;

abstract class _PlantStore with Store {
  @observable
  Plant plant;

  @action
  void initState(Plant plant) {
    this.plant = plant;
    fetch(plant.id);
  }

  @action
  void updatePlant(Plant plant) {
    RepositoryProvider.provider.plantRepo.update(plant);
    fetch(plant.id);
  }

  @action
  void deletePlant() {
    File(plant.imgPath).delete();
    RepositoryProvider.provider.plantRepo.deleteById(plant.id);
  }

  @action
  void fetch(int plantId) {
    RepositoryProvider.provider.plantRepo
        .find(plantId)
        .then((plant) => this.plant = plant);
  }

  @computed
  String get waterDaysLeft =>
      getDaysLeft(plant.waterStart, plant.waterInterval * msPerDay);

  @computed
  String get fertilizeDaysLeft =>
      getDaysLeft(plant.fertilizerStart, plant.fertilizerInterval * msPerDay);

  String getDaysLeft(int start, int interval) {
    var now = DateTime.now().millisecondsSinceEpoch;
    int daysLeft;
    while(daysLeft == null) {
      start += interval;
      if (now < start) daysLeft = ((start - now) / msPerDay).round();
    }
    if (daysLeft == 1) return "Today";
    if (daysLeft == 2) return "Tomorrow";
    return "$daysLeft days";
  }
}
