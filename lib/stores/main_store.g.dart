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
}
