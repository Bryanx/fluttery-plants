import 'dart:io';

import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/repository/repository_provider.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
import 'package:fluttering_plants/stores/plant_store.dart';
import 'package:mobx/mobx.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  final plantStore = PlantStore();
  final plantListStore = PlantListStore();

  @observable
  int navigationIndex = 0;

  @action
  void setNavigationIndex(value) =>
      navigationIndex = value;
}
