import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/product_model.dart';
import '../../data/repo/product_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepo _productRepo;

  HomeCubit(this._productRepo) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());

    try {
      final products = await _productRepo.getProducts();

      emit(HomeSuccess(products));
    } catch (e) {
      emit(HomeError('Failed to get products'));
    }
  }
}