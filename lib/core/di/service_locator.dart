import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:food_app/core/networking/dio_factory.dart';

import '../../features/home/data/repo/product_repo.dart';
import '../../features/login/data/repo/login_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final dio = DioFactory().create();

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<LoginRepo>(
        () => LoginRepo(getIt()),
  );

  getIt.registerLazySingleton<ProductRepo>(
        () => ProductRepo(getIt()),
  );
}