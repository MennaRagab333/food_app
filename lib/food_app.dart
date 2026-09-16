import 'package:flutter/material.dart';
import 'package:food_app/core/routes/app_router.dart';
import 'package:food_app/core/routes/app_routes.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreen,
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}