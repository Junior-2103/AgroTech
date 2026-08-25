abstract final class AlertMessages {
  // # Temperature
  static const String criticalHot =
      "Temperatura muito alta, regue imediatamente";
  static const String criticalCold =
      "Temperatura muito baixa, proteja com cobertura ou estufa";
  static const String warningHot =
      "Temperatura alta, considere colocá-la na sombra";
  static const String warningCold = "Temperatura baixa, evite regar à noite";

  // # Humidity
  static const String humidityHigh =
      "Umidade muito alta, coloque em um local ventilado";
  static const String humidityLow = "Umidade muito baixa, regue com frequência";

  // # Wind
  static const String windHigh =
      "Velocidade do vento muito alta, considere guardá-la";

  // # Severity
  static const String alertRecommendedSeverity = "Recomendação";
  static const String alertWarningSeverity = "Alerta";
  static const String alertDangerSeverity = "Perigo";
}
