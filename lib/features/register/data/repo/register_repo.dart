import 'package:dio/dio.dart';

class RegisterRepo {
  final Dio _dio;

  RegisterRepo(this._dio);

  Future<void> register() async {
    try {
      final response = await _dio.post(
        '/register',
        data: {
          'name': 'Customer',
          'email': 'customer@example.com',
          'password': '123456',
        },
      );

      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}