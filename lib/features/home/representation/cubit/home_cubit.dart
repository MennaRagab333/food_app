import 'package:bloc/bloc.dart';
import 'package:food_app/core/networking/api_result.dart';

import '../../data/models/product_model.dart';
import '../../data/repo/product_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepo _productRepo;

  HomeCubit(this._productRepo) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());

    final result = await _productRepo.getProducts();

    switch (result) {
      case Success<List<ProductModel>>(data: final products):
        emit(HomeSuccess(products));

      case Error<List<ProductModel>>(error: final message):
        emit(HomeError(message));
    }
  }
}