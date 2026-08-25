class Weather {
  Weather({
    required this.latitude,
    required this.longitude,
    required this.units,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  final double latitude;
  final double longitude;
  final Units units;
  final Current current;
  final Hourly hourly;
  final Daily daily;
}

class Units {
  Units({
    required this.interval,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
    required this.precipitation,
    required this.cloudCover,
  });

  final String interval;
  final String temperature2m;
  final String relativeHumidity2m;
  final String windSpeed10m;
  final String precipitation;
  final String cloudCover;
}

class Current {
  Current({
    required this.time,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
    required this.precipitation,
    required this.cloudCover,
    required this.weatherCode,
  });

  final String time;
  final double temperature2m;
  final int relativeHumidity2m;
  final double windSpeed10m;
  final double precipitation;
  final int cloudCover;
  final int weatherCode;
}

class Hourly {
  Hourly({required this.time});

  final List<dynamic> time;
}

class Daily {
  Daily({required this.time});

  final List<dynamic> time;
}
