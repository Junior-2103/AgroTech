import 'package:agrotech/constants/app_strings.dart';
import 'package:agrotech/models/alert.dart';
import 'package:agrotech/models/weather.dart';
import 'package:agrotech/repositories/plants_repository.dart';
import 'package:agrotech/repositories/weather_repository.dart';
import 'package:agrotech/services/location_service.dart';
import 'package:agrotech/themes/app_colors.dart';
import 'package:agrotech/usecases/check_plant_health.dart';
import 'package:agrotech/utils/weather_code_mapper.dart';
import 'package:agrotech/widgets/alert_tile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PlantsRepository plantsRepository = PlantsRepository();
  final WeatherRepository weatherRepository = WeatherRepository();
  final CheckPlantHealth checkPlantHealth = CheckPlantHealth();
  late Position position;
  late Weather weather;

  @override
  void initState() {
    super.initState();
    plantsRepository.init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LocationService().getLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: LinearProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(AppStrings.locationError));
        }

        if (snapshot.hasData) {
          position = snapshot.data!;
          return FutureBuilder(
            future: weatherRepository.getWeather(position),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(AppStrings.connectionError));
              }
              if (snapshot.hasData) {
                weather = snapshot.data!;
                return Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  body: ListView(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: AppColors.blackColor),
                        ),
                        color: AppColors.accentColor,
                        margin: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            _weatherHeader(),
                            Divider(
                              indent: 42,
                              endIndent: 42,
                              color: AppColors.backgroundColor,
                            ),
                            _weatherInfo(),
                          ],
                        ),
                      ),
                      ...plantsRepository.getPlants().map((plant) {
                        Map<String, List<Alert>>? plantAlerts = checkPlantHealth
                            .checkPlant(plant, weather);
                        if (plantAlerts != null) {
                          return AlertTile(alerts: plantAlerts);
                        } else {
                          return SizedBox.shrink();
                        }
                      }),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            }),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _weatherHeader() {
    final (svg, weatherText) = WeatherCodeMapper().weatherCodeToText(
      weather.current.weatherCode,
    );
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "${weather.current.temperature2m.toInt()} ${weather.units.temperature2m}",
                style: TextStyle(
                  color: AppColors.surfaceColor,
                  fontSize: 48,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                weatherText,
                style: TextStyle(color: AppColors.backgroundColor),
              ),
            ],
          ),
          Spacer(),
          SizedBox(height: 100, width: 100, child: svg ?? SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _weatherInfo() {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "${weather.current.relativeHumidity2m} ${weather.units.relativeHumidity2m}",
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 16,
                ),
              ),
              Text(
                AppStrings.humidity,
                style: TextStyle(color: AppColors.backgroundColor),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "${weather.current.windSpeed10m} ${weather.units.windSpeed10m}",
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 16,
                ),
              ),
              Text(
                AppStrings.wind,
                style: TextStyle(color: AppColors.backgroundColor),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "${weather.current.precipitation} ${weather.units.precipitation}",
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: 16,
                ),
              ),
              Text(
                AppStrings.rain,
                style: TextStyle(color: AppColors.backgroundColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
