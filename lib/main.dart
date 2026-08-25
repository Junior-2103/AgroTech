import 'package:agrotech/configs/app_routes.dart';
import 'package:agrotech/models/plant.dart';
import 'package:agrotech/repositories/plants_repository.dart';
import 'package:agrotech/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(PlantAdapter());

  await PlantsRepository().init();

  runApp(const AgroTech());
}

class AgroTech extends StatelessWidget {
  const AgroTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroTech',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      routes: AppRoutes.getRoutes(context),
      home: const WelcomeScreen(),
    );
  }
}
