import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/di/service_locator.dart';
import 'package:food_app/core/routes/app_routes.dart';


import '../../features/home/representation/cubit/home_cubit.dart';
import '../../features/home/representation/ui/home_screen.dart';
import '../../features/login/representation/cubit/login_cubit.dart';
import '../../features/login/representation/ui/login_screen.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(getIt())..getProducts(),
            child: const HomeScreen(),
          ),
        );

      default:
        return null;
    }
  }
}