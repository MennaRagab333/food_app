import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_app/core/networking/api_error_handler.dart';
import 'package:food_app/core/networking/api_result.dart';
import 'package:food_app/core/networking/api_constants.dart';

class LoginRepo {
  final Dio _dio;

  LoginRepo(this._dio);

  Future<ApiResult<String>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {
          'username': username,
          'password': password,
        },
      );

      final token = response.data['accessToken'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      return Success(token);
    } on DioException catch (error) {
      return Error(ApiErrorHandler.handle(error).message);
    }
  }
}