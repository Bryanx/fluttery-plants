import 'package:fluttering_plants/model/plant.dart';

///
/// Initial testing data.
///
class TestData {
  static List<Plant> generateTestPlants() {
    var now = DateTime.now().millisecondsSinceEpoch;
    var plant1 = Plant(
        id: 1,
        name: "Sansevieria trifasciata",
        nickName: "Snake plant",
        imgPath: "assets/sensevieria.jpg",
        waterStart: now,
        fertilizerStart: now);
    var plant2 = Plant(
        id: 2,
        name: "Tradescantia zebrina",
        nickName: "Inchplant",
        imgPath: "assets/inch.jpg",
        waterStart: now,
        fertilizerStart: now);
    var plant3 = Plant(
        id: 3,
        name: "Monstera deliciosa",
        nickName: "Windowleaf",
        imgPath: "assets/monstera.jpg",
        waterStart: now,
        fertilizerStart: now);
    var plant4 = Plant(
        id: 4,
        name: "Monstera deliciosa",
        nickName: "Windowleaf",
        imgPath: "assets/monstera.jpg",
        waterStart: now,
        fertilizerStart: now);
    var plant5 = Plant(
        id: 5,
        name: "Monstera deliciosa",
        nickName: "Windowleaf",
        imgPath: "assets/monstera.jpg",
        waterStart: now,
        fertilizerStart: now);
    return [plant1, plant2, plant3, plant4, plant5];
  }
}
