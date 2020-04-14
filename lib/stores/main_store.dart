import 'dart:io';

import 'package:fluttering_plants/screens/navigation/drag_direction.dart';
import 'package:fluttering_plants/screens/navigation/page.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
import 'package:fluttering_plants/stores/plant_store.dart';
import 'package:mobx/mobx.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  final plantStore = PlantStore();
  final plantListStore = PlantListStore();

  @observable
  Page currentPage = Page.Plants;

  @observable
  int currentPlantIndex = 0;

  @observable
  Direction tabDragDirection = Direction.LEFT;

  @action
  void setCurrentPage(value) => currentPage = value;

  @action
  void settTabDragDirection(value) => tabDragDirection = value;

  @action
  void setCurrentPlantIndex(value) => currentPlantIndex = value;
}
