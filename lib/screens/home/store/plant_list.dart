import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/repository/repository_provider.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'plant_list.g.dart';

class PlantList = _PlantList with _$PlantList;

abstract class _PlantList with Store {
  @observable
  ObservableList<Plant> plants = ObservableList<Plant>();

  @action
  void add(Plant plant) {
    RepositoryProvider.provider.plantRepo.insert(plant);
    fetch();
  }

  @action
  void update(Plant plant) {
    RepositoryProvider.provider.plantRepo.update(plant);
    fetch();
  }

  @action
  void fetch() {
    RepositoryProvider.provider.plantRepo
        .getAll()
        .then((result) => plants = ObservableList.of(result));
  }
}