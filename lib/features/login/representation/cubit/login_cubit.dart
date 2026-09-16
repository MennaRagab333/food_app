import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(LoginInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final token = await _loginRepo.login(
        username: username,
        password: password,
      );

      emit(LoginSuccess(token));
    } catch (e) {
      emit(LoginError('Login failed'));
    }
  }
}