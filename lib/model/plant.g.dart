// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plant _$PlantFromJson(Map<String, dynamic> json) {
  return Plant(
    id: json['id'],
    name: json['name'],
    nickName: json['nick_name'],
    imgPath: json['img_path'],
    waterStart: json['water_start'],
    waterInterval: json['water_interval'],
    fertilizerStart: json['fertilizer_start'],
    fertilizerInterval: json['fertilizer_interval'],
  );
}

Map<String, dynamic> _$PlantToJson(Plant instance) => <String, dynamic>{
      'id': instance.id,
      'nick_name': instance.nickName,
      'name': instance.name,
      'img_path': instance.imgPath,
      'water_start': instance.waterStart,
      'water_interval': instance.waterInterval,
      'fertilizer_start': instance.fertilizerStart,
      'fertilizer_interval': instance.fertilizerInterval,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Plant on _Plant, Store {
  final _$idAtom = Atom(name: '_Plant.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$nickNameAtom = Atom(name: '_Plant.nickName');

  @override
  String get nickName {
    _$nickNameAtom.context.enforceReadPolicy(_$nickNameAtom);
    _$nickNameAtom.reportObserved();
    return super.nickName;
  }

  @override
  set nickName(String value) {
    _$nickNameAtom.context.conditionallyRunInAction(() {
      super.nickName = value;
      _$nickNameAtom.reportChanged();
    }, _$nickNameAtom, name: '${_$nickNameAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_Plant.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$imgPathAtom = Atom(name: '_Plant.imgPath');

  @override
  String get imgPath {
    _$imgPathAtom.context.enforceReadPolicy(_$imgPathAtom);
    _$imgPathAtom.reportObserved();
    return super.imgPath;
  }

  @override
  set imgPath(String value) {
    _$imgPathAtom.context.conditionallyRunInAction(() {
      super.imgPath = value;
      _$imgPathAtom.reportChanged();
    }, _$imgPathAtom, name: '${_$imgPathAtom.name}_set');
  }

  final _$waterStartAtom = Atom(name: '_Plant.waterStart');

  @override
  int get waterStart {
    _$waterStartAtom.context.enforceReadPolicy(_$waterStartAtom);
    _$waterStartAtom.reportObserved();
    return super.waterStart;
  }

  @override
  set waterStart(int value) {
    _$waterStartAtom.context.conditionallyRunInAction(() {
      super.waterStart = value;
      _$waterStartAtom.reportChanged();
    }, _$waterStartAtom, name: '${_$waterStartAtom.name}_set');
  }

  final _$waterIntervalAtom = Atom(name: '_Plant.waterInterval');

  @override
  int get waterInterval {
    _$waterIntervalAtom.context.enforceReadPolicy(_$waterIntervalAtom);
    _$waterIntervalAtom.reportObserved();
    return super.waterInterval;
  }

  @override
  set waterInterval(int value) {
    _$waterIntervalAtom.context.conditionallyRunInAction(() {
      super.waterInterval = value;
      _$waterIntervalAtom.reportChanged();
    }, _$waterIntervalAtom, name: '${_$waterIntervalAtom.name}_set');
  }

  final _$fertilizerStartAtom = Atom(name: '_Plant.fertilizerStart');

  @override
  int get fertilizerStart {
    _$fertilizerStartAtom.context.enforceReadPolicy(_$fertilizerStartAtom);
    _$fertilizerStartAtom.reportObserved();
    return super.fertilizerStart;
  }

  @override
  set fertilizerStart(int value) {
    _$fertilizerStartAtom.context.conditionallyRunInAction(() {
      super.fertilizerStart = value;
      _$fertilizerStartAtom.reportChanged();
    }, _$fertilizerStartAtom, name: '${_$fertilizerStartAtom.name}_set');
  }

  final _$fertilizerIntervalAtom = Atom(name: '_Plant.fertilizerInterval');

  @override
  int get fertilizerInterval {
    _$fertilizerIntervalAtom.context
        .enforceReadPolicy(_$fertilizerIntervalAtom);
    _$fertilizerIntervalAtom.reportObserved();
    return super.fertilizerInterval;
  }

  @override
  set fertilizerInterval(int value) {
    _$fertilizerIntervalAtom.context.conditionallyRunInAction(() {
      super.fertilizerInterval = value;
      _$fertilizerIntervalAtom.reportChanged();
    }, _$fertilizerIntervalAtom, name: '${_$fertilizerIntervalAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},nickName: ${nickName.toString()},name: ${name.toString()},imgPath: ${imgPath.toString()},waterStart: ${waterStart.toString()},waterInterval: ${waterInterval.toString()},fertilizerStart: ${fertilizerStart.toString()},fertilizerInterval: ${fertilizerInterval.toString()}';
    return '{$string}';
  }
}
