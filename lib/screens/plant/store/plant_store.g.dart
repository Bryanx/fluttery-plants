// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlantStore on _PlantStore, Store {
  Computed<String> _$waterDaysLeftComputed;

  @override
  String get waterDaysLeft =>
      (_$waterDaysLeftComputed ??= Computed<String>(() => super.waterDaysLeft))
          .value;
  Computed<String> _$fertilizeDaysLeftComputed;

  @override
  String get fertilizeDaysLeft => (_$fertilizeDaysLeftComputed ??=
          Computed<String>(() => super.fertilizeDaysLeft))
      .value;

  final _$plantAtom = Atom(name: '_PlantStore.plant');

  @override
  Plant get plant {
    _$plantAtom.context.enforceReadPolicy(_$plantAtom);
    _$plantAtom.reportObserved();
    return super.plant;
  }

  @override
  set plant(Plant value) {
    _$plantAtom.context.conditionallyRunInAction(() {
      super.plant = value;
      _$plantAtom.reportChanged();
    }, _$plantAtom, name: '${_$plantAtom.name}_set');
  }

  final _$_PlantStoreActionController = ActionController(name: '_PlantStore');

  @override
  void initState(Plant plant) {
    final _$actionInfo = _$_PlantStoreActionController.startAction();
    try {
      return super.initState(plant);
    } finally {
      _$_PlantStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePlant(Plant plant) {
    final _$actionInfo = _$_PlantStoreActionController.startAction();
    try {
      return super.updatePlant(plant);
    } finally {
      _$_PlantStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetch(int plantId) {
    final _$actionInfo = _$_PlantStoreActionController.startAction();
    try {
      return super.fetch(plantId);
    } finally {
      _$_PlantStoreActionController.endAction(_$actionInfo);
    }
  }
}
