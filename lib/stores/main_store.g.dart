// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$navigationIndexAtom = Atom(name: '_MainStore.navigationIndex');

  @override
  int get navigationIndex {
    _$navigationIndexAtom.context.enforceReadPolicy(_$navigationIndexAtom);
    _$navigationIndexAtom.reportObserved();
    return super.navigationIndex;
  }

  @override
  set navigationIndex(int value) {
    _$navigationIndexAtom.context.conditionallyRunInAction(() {
      super.navigationIndex = value;
      _$navigationIndexAtom.reportChanged();
    }, _$navigationIndexAtom, name: '${_$navigationIndexAtom.name}_set');
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  void setNavigationIndex(dynamic value) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setNavigationIndex(value);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }
}
