import 'dart:convert';
import 'package:agrotech/models/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  static const _currentParams =
      "temperature_2m,relative_humidity_2m,wind_speed_10m,precipitation,cloud_cover,weather_code";
  static const _hourlyParams = "";
  static const _dailyParams = "";

  Future<Weather?> getWeather(Position position) async {
    final http.Response response = await http.get(
      Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=${position.latitude}&longitude=${position.longitude}&current=$_currentParams&hourly=$_hourlyParams&daily=$_dailyParams",
      ),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final unitJson = json["current_units"];

      Units units = Units(
        interval: unitJson["interval"],
        temperature2m: unitJson["temperature_2m"],
        relativeHumidity2m: unitJson["relative_humidity_2m"],
        windSpeed10m: unitJson["wind_speed_10m"],
        precipitation: unitJson["precipitation"],
        cloudCover: unitJson["cloud_cover"],
      );

      final currentJson = json["current"];

      Current current = Current(
        time: currentJson["time"],
        temperature2m: currentJson["temperature_2m"],
        relativeHumidity2m: currentJson["relative_humidity_2m"],
        windSpeed10m: currentJson["wind_speed_10m"],
        precipitation: currentJson["precipitation"],
        cloudCover: currentJson["cloud_cover"],
        weatherCode: currentJson["weather_code"],
      );

      final hourlyJson = json["hourly"];

      Hourly hourly = Hourly(time: hourlyJson["time"]);

      final dailyJson = json["daily"];

      Daily daily = Daily(time: dailyJson["time"]);

      return Weather(
        latitude: position.latitude,
        longitude: position.longitude,
        units: units,
        current: current,
        hourly: hourly,
        daily: daily,
      );
    } else {
      return null;
    }
  }
}
