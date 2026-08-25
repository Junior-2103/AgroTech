enum AlertSeverity { danger, warning, recommended }

enum AlertType { temperature, humidity, wind }

class Alert {
  Alert({required this.severity, required this.type, required this.message});

  AlertSeverity severity;
  AlertType type;
  String message;
}
