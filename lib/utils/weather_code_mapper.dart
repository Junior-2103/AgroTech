import 'package:agrotech/constants/app_assets.dart';
import 'package:agrotech/constants/weather_messages.dart';
import 'package:flutter_svg/svg.dart';

class WeatherCodeMapper {
  (SvgPicture?, String) weatherCodeToText(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return (
          SvgPicture.asset(AppAssets.iconHomeClear),
          WeatherMessages.weatherClear,
        );
      case 1 || 2 || 3:
        return (
          SvgPicture.asset(AppAssets.iconHomeCloudy),
          WeatherMessages.weatherPartlyCloudy,
        );
      case 45 || 46 || 47 || 48:
        return (
          SvgPicture.asset(AppAssets.iconHomeCloudy),
          WeatherMessages.weatherCloudy,
        );
      case >= 51 && <= 67:
        return (
          SvgPicture.asset(AppAssets.iconHomeRain),
          WeatherMessages.weatherRain,
        );
      case >= 71 && <= 77:
        return (
          SvgPicture.asset(AppAssets.iconHomeSnow),
          WeatherMessages.weatherSnow,
        );
      case >= 80 && <= 99:
        return (
          SvgPicture.asset(AppAssets.iconHomeStorm),
          WeatherMessages.weatherStorm,
        );
      default:
        return (null, WeatherMessages.weatherUndefined);
    }
  }
}
