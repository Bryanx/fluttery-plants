import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/repository/repository_provider.dart';
import 'package:mobx/mobx.dart';

part 'plant_list_store.g.dart';

class PlantListStore = _PlantListStore with _$PlantListStore;

abstract class _PlantListStore with Store {
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