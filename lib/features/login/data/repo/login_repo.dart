
import 'package:dio/dio.dart';
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

return Success(response.data['accessToken']);
} on DioException catch (error) {
return Error(ApiErrorHandler.handle(error).message);
}
}
}

