import 'package:agrotech/configs/app_routes.dart';
import 'package:agrotech/constants/app_assets.dart';
import 'package:agrotech/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:agrotech/themes/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.appName,
          style: TextStyle(color: AppColors.accentColor),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AppAssets.iconWelcomePlant,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Spacer(),
                Text(
                  AppStrings.welcomeTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 46,
                    fontFamily: "PlayfairDisplay",
                  ),
                ),
                Text(
                  AppStrings.appDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 46,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      AppStrings.startButton,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
