import 'package:dio/dio.dart';
import 'package:food_app/core/networking/api_constants.dart';
import 'package:food_app/core/networking/api_error_handler.dart';
import 'package:food_app/core/networking/api_result.dart';

import '../models/product_model.dart';

class ProductRepo {
  final Dio _dio;

  ProductRepo(this._dio);

  Future<ApiResult<List<ProductModel>>> getProducts() async {
    try {
      final response = await _dio.get(ApiConstants.products);

      final List products = response.data['products'];

      final productList = products
          .map(
            (product) => ProductModel.fromJson(product),
      )
          .toList();

      return Success<List<ProductModel>>(productList);
    } on DioException catch (error) {
      return Error<List<ProductModel>>(
        ApiErrorHandler.handle(error).message,
      );
    }
  }
}