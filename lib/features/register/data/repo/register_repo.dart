
import 'package:dio/dio.dart';
import 'package:food_app/core/networking/api_error_handler.dart';
import 'package:food_app/core/networking/api_result.dart';

class RegisterRepo {
final Dio _dio;

RegisterRepo(this._dio);

Future<ApiResult<String>> register({
required String name,
required String email,
required String password,
}) async {
try {
final response = await _dio.post(
'/users/add',
data: {
'firstName': name,
'email': email,
'password': password,
},
);

return Success(response.data['id'].toString());
} on DioException catch (error) {
return Error(ApiErrorHandler.handle(error).message);
}
}
}

