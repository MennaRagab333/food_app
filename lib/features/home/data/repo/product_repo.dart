import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductRepo {
  final Dio _dio;

  ProductRepo(this._dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get('/products');

    final List products = response.data['products'];

    return products
        .map(
          (product) => ProductModel.fromJson(product),
    )
        .toList();
  }
}