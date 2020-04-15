import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'plant.g.dart';

///
/// Main plant model.
/// TODO: find a way to separate PlantStore and model?
///
@JsonSerializable(fieldRename: FieldRename.snake)
class Plant extends _Plant with _$Plant {
  Plant(
      {id,
      name = "Official name",
      nickName = "Charles",
      imgPath = "assets/sensevieria.jpg",
      waterStart = -1,
      waterInterval = 5,
      fertilizerStart = -1,
      fertilizerInterval = 30})
      : super(
          id: id,
          name: name,
          nickName: nickName,
          imgPath: imgPath,
          waterInterval: waterInterval,
          fertilizerInterval: fertilizerInterval,
        );

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);

  Map<String, dynamic> toJson() => _$PlantToJson(this);
}

abstract class _Plant extends Equatable with Store {
  @observable
  int id;
  @observable
  String nickName;
  @observable
  String name;
  @observable
  String imgPath;
  @observable
  int waterStart; // in ms
  @observable
  int waterInterval; // in days
  @observable
  int fertilizerStart; // in ms
  @observable
  int fertilizerInterval; // in days

  _Plant(
      {this.id,
      this.name = "Official name",
      this.nickName = "Charles",
      this.imgPath = "assets/sensevieria.jpg",
      this.waterInterval = 5,
      this.fertilizerInterval = 30}) {
    this.waterStart = DateTime.now().millisecondsSinceEpoch;
    this.fertilizerStart = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  String toString() {
    return "{\n"
        "\tid: $id,\n" +
        "\tname: $name,\n" +
        "\tnickName: $nickName,\n" +
        "\timgPath: $imgPath,\n" +
        "\twaterInterval: $waterInterval,\n" +
        "\tfertilizerInterval: $fertilizerInterval,\n" +
        "\twaterStart: $waterStart,\n" +
        "\tfertilizerStart: $fertilizerStart,\n" +
        "}";
  }
}
