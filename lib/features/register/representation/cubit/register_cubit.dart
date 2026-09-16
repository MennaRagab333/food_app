import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(RegisterInitial());

  Future<void> register() async {
    emit(RegisterLoading());

    try {
      await _registerRepo.register();
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}