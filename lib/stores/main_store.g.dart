// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$currentPageAtom = Atom(name: '_MainStore.currentPage');

  @override
  Page get currentPage {
    _$currentPageAtom.context.enforceReadPolicy(_$currentPageAtom);
    _$currentPageAtom.reportObserved();
    return super.currentPage;
  }

  @override
  set currentPage(Page value) {
    _$currentPageAtom.context.conditionallyRunInAction(() {
      super.currentPage = value;
      _$currentPageAtom.reportChanged();
    }, _$currentPageAtom, name: '${_$currentPageAtom.name}_set');
  }

  final _$currentPlantIndexAtom = Atom(name: '_MainStore.currentPlantIndex');

  @override
  int get currentPlantIndex {
    _$currentPlantIndexAtom.context.enforceReadPolicy(_$currentPlantIndexAtom);
    _$currentPlantIndexAtom.reportObserved();
    return super.currentPlantIndex;
  }

  @override
  set currentPlantIndex(int value) {
    _$currentPlantIndexAtom.context.conditionallyRunInAction(() {
      super.currentPlantIndex = value;
      _$currentPlantIndexAtom.reportChanged();
    }, _$currentPlantIndexAtom, name: '${_$currentPlantIndexAtom.name}_set');
  }

  final _$tabDragDirectionAtom = Atom(name: '_MainStore.tabDragDirection');

  @override
  Direction get tabDragDirection {
    _$tabDragDirectionAtom.context.enforceReadPolicy(_$tabDragDirectionAtom);
    _$tabDragDirectionAtom.reportObserved();
    return super.tabDragDirection;
  }

  @override
  set tabDragDirection(Direction value) {
    _$tabDragDirectionAtom.context.conditionallyRunInAction(() {
      super.tabDragDirection = value;
      _$tabDragDirectionAtom.reportChanged();
    }, _$tabDragDirectionAtom, name: '${_$tabDragDirectionAtom.name}_set');
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  void setCurrentPage(dynamic value) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void settTabDragDirection(dynamic value) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.settTabDragDirection(value);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPlantIndex(dynamic value) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setCurrentPlantIndex(value);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentPage: ${currentPage.toString()},currentPlantIndex: ${currentPlantIndex.toString()},tabDragDirection: ${tabDragDirection.toString()}';
    return '{$string}';
  }
}
