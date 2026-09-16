import 'package:dio/dio.dart';

class LoginRepo {
  final Dio _dio;

  LoginRepo(this._dio);

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final response = await _dio.post(
      '/auth/login',
      data: {
        'username': username,
        'password': password,
      },
    );

    return response.data['accessToken'];
  }
}