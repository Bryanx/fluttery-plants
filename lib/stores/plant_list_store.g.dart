// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlantListStore on _PlantListStore, Store {
  final _$plantsAtom = Atom(name: '_PlantListStore.plants');

  @override
  ObservableList<Plant> get plants {
    _$plantsAtom.context.enforceReadPolicy(_$plantsAtom);
    _$plantsAtom.reportObserved();
    return super.plants;
  }

  @override
  set plants(ObservableList<Plant> value) {
    _$plantsAtom.context.conditionallyRunInAction(() {
      super.plants = value;
      _$plantsAtom.reportChanged();
    }, _$plantsAtom, name: '${_$plantsAtom.name}_set');
  }

  final _$_PlantListStoreActionController =
      ActionController(name: '_PlantListStore');

  @override
  void add(Plant plant) {
    final _$actionInfo = _$_PlantListStoreActionController.startAction();
    try {
      return super.add(plant);
    } finally {
      _$_PlantListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(Plant plant) {
    final _$actionInfo = _$_PlantListStoreActionController.startAction();
    try {
      return super.update(plant);
    } finally {
      _$_PlantListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetch() {
    final _$actionInfo = _$_PlantListStoreActionController.startAction();
    try {
      return super.fetch();
    } finally {
      _$_PlantListStoreActionController.endAction(_$actionInfo);
    }
  }
}
