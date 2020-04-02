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

  final _$addAsyncAction = AsyncAction('add');

  @override
  Future<dynamic> add(Plant plant) {
    return _$addAsyncAction.run(() => super.add(plant));
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<dynamic> update(Plant plant) {
    return _$updateAsyncAction.run(() => super.update(plant));
  }

  final _$fetchAsyncAction = AsyncAction('fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }
}
