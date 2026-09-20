
import 'package:dio/dio.dart';
import 'package:food_app/core/networking/api_error_model.dart';

class ApiErrorHandler {
final String message;
final int? statusCode;

ApiErrorHandler._({
required this.message,
this.statusCode,
});

static ApiErrorHandler handle(DioException error) {
final statusCode = error.response?.statusCode;

switch (error.type) {
case DioExceptionType.connectionTimeout:
case DioExceptionType.sendTimeout:
case DioExceptionType.receiveTimeout:
return ApiErrorHandler._(
message: 'Connection timed out. Please try again.',
statusCode: statusCode,
);

case DioExceptionType.connectionError:
return ApiErrorHandler._(
message: 'No internet connection. Please check your network.',
statusCode: statusCode,
);

case DioExceptionType.badCertificate:
return ApiErrorHandler._(
message: 'Security certificate error.',
statusCode: statusCode,
);

case DioExceptionType.badResponse:
final data = error.response?.data;

if (data is Map<String, dynamic>) {
final apiError = ApiErrorModel.fromJson(data);

return ApiErrorHandler._(
message: apiError.message,
statusCode: statusCode,
);
}

return ApiErrorHandler._(
message: 'Server error. Please try again.',
statusCode: statusCode,
);

case DioExceptionType.cancel:
return ApiErrorHandler._(
message: 'Request was cancelled.',
statusCode: statusCode,
);

case DioExceptionType.unknown:
case DioExceptionType.transformTimeout:
return ApiErrorHandler._(
message: 'Something went wrong. Please try again.',
statusCode: statusCode,
);
}
}
}

