
import 'package:flutter/material.dart';
import 'package:fluttering_plants/repository/plant_repository.dart';

class RepositoryProvider {
  static final RepositoryProvider provider = RepositoryProvider();

  PlantRepository plantRepository;

  PlantRepository get plantRepo {
    if (plantRepository != null) return plantRepository;
    plantRepository = PlantRepository();
    return plantRepository;
  }
}