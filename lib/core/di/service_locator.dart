import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:food_app/core/networking/dio_factory.dart';
import 'package:food_app/features/home/data/repo/product_repo.dart';
import 'package:food_app/features/login/data/repo/login_repo.dart';
import 'package:food_app/features/register/data/repo/register_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<Dio>(
        () => DioFactory().create(),
  );

  getIt.registerLazySingleton<LoginRepo>(
        () => LoginRepo(getIt<Dio>()),
  );

  getIt.registerLazySingleton<ProductRepo>(
        () => ProductRepo(getIt<Dio>()),
  );

  getIt.registerLazySingleton<RegisterRepo>(
        () => RegisterRepo(getIt<Dio>()),
  );
}