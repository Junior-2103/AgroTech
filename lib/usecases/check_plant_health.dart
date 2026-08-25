import 'package:agrotech/models/alert.dart';
import 'package:agrotech/models/plant.dart';
import 'package:agrotech/models/weather.dart';
import 'package:agrotech/constants/alert_messages.dart';

class CheckPlantHealth {
  Alert? checkTemperature(Plant plant, Weather weather) {
    Current current = weather.current;

    if (current.temperature2m > plant.tempMaxSuportada) {
      return Alert(
        severity: AlertSeverity.danger,
        type: AlertType.temperature,
        message: AlertMessages.criticalHot,
      );
    } else if (current.temperature2m < plant.tempMinSuportada) {
      return Alert(
        severity: AlertSeverity.danger,
        type: AlertType.temperature,
        message: AlertMessages.criticalHot,
      );
    } else if (current.temperature2m > plant.tempIdealMax) {
      return Alert(
        severity: AlertSeverity.warning,
        type: AlertType.temperature,
        message: AlertMessages.warningHot,
      );
    } else if (current.temperature2m < plant.tempIdealMin) {
      return Alert(
        severity: AlertSeverity.warning,
        type: AlertType.temperature,
        message: AlertMessages.warningCold,
      );
    }
    return null;
  }

  Alert? checkHumidity(Plant plant, Weather weather) {
    Current current = weather.current;

    if (current.relativeHumidity2m > plant.umidadeIdealMax) {
      return Alert(
        severity: AlertSeverity.warning,
        type: AlertType.humidity,
        message: AlertMessages.humidityHigh,
      );
    } else if (current.relativeHumidity2m < plant.umidadeIdealMin) {
      return Alert(
        severity: AlertSeverity.warning,
        type: AlertType.humidity,
        message: AlertMessages.humidityLow,
      );
    }
    return null;
  }

  Alert? checkWind(Plant plant, Weather weather) {
    Current current = weather.current;

    if (current.windSpeed10m > plant.velVentoMax) {
      return Alert(
        severity: AlertSeverity.warning,
        type: AlertType.wind,
        message: AlertMessages.windHigh,
      );
    }
    return null;
  }

  Map<String, List<Alert>>? checkPlant(Plant plant, Weather weather) {
    Map<String, List<Alert>> plantAlerts = {
      plant.produto: [
        checkTemperature(plant, weather),
        checkHumidity(plant, weather),
        checkWind(plant, weather),
      ].whereType<Alert>().toList(),
    };

    if (plantAlerts.values.first.isEmpty) {
      return null;
    }

    return plantAlerts;
  }
}
