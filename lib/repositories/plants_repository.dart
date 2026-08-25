import 'package:agrotech/constants/app_assets.dart';
import 'package:agrotech/models/plant.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:hive/hive.dart';

class PlantsRepository {
  static const _csvFile = AppAssets.csvFile;
  static const _boxName = "plants";

  late Box<Plant> _box;

  static final PlantsRepository _instance = PlantsRepository._internal();

  factory PlantsRepository() {
    return _instance;
  }

  PlantsRepository._internal();

  Future<void> init() async {
    _box = await Hive.openBox<Plant>(_boxName);

    if (_box.isEmpty) {
      await _loadCsv();
    }
  }

  Future<void> _loadCsv() async {
    final csvString = await rootBundle.loadString(_csvFile);
    List<CsvRow> csvPlants = csv.decodeWithHeaders(csvString);

    for (var csvPlant in csvPlants) {
      Plant plant = Plant.fromMap(csvPlant.toMap());
      _box.put(plant.produto, plant);
    }
  }

  List<Plant> getPlants() {
    return _box.values.toList();
  }
}
