import 'package:agrotech/constants/alert_messages.dart';
import 'package:agrotech/models/alert.dart';
import 'package:agrotech/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AlertTile extends StatelessWidget {
  const AlertTile({super.key, required this.alerts});

  final Map<String, List<Alert>> alerts;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surfaceColor,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: AppColors.blackColor, width: 1),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              alerts.keys.first,
              style: TextStyle(
                fontFamily: "PlayfairDisplay",
                color: AppColors.accentColor,
                fontSize: 28,
              ),
            ),
            ...alerts.values.first.map((alert) {
              return alertsTile(alert);
            }),
          ],
        ),
      ),
    );
  }

  Widget alertsTile(Alert alert) {
    return Container(
      padding: EdgeInsets.only(left: 4),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 4,
            color: switch (alert.severity) {
              AlertSeverity.recommended => AppColors.recomendedColor,
              AlertSeverity.warning => AppColors.warningColor,
              AlertSeverity.danger => AppColors.alertColor,
            },
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            switch (alert.severity) {
              AlertSeverity.recommended =>
                AlertMessages.alertRecommendedSeverity,
              AlertSeverity.warning => AlertMessages.alertWarningSeverity,
              AlertSeverity.danger => AlertMessages.alertDangerSeverity,
            },
            style: TextStyle(
              color: switch (alert.severity) {
                AlertSeverity.recommended => AppColors.recomendedTextColor,
                AlertSeverity.warning => AppColors.warningTextColor,
                AlertSeverity.danger => AppColors.alertTextColor,
              },
            ),
          ),
          Text(alert.message, style: TextStyle(color: AppColors.textColor)),
        ],
      ),
    );
  }
}
