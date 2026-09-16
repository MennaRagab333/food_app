import 'package:flutter/material.dart';
import 'package:food_app/core/di/service_locator.dart';
import 'package:food_app/food_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  runApp(const FoodApp());
}