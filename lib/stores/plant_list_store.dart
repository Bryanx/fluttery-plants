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
  }

  @action
  Future update(Plant plant) async {
    await RepositoryProvider.provider.plantRepo.update(plant);
    await fetch();
  }

  @action
  Future fetch() async {
    await RepositoryProvider.provider.plantRepo
        .getAll()
        .then((result) => plants = ObservableList.of(result));
  }
}