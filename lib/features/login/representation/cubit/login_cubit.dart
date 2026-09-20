
import 'package:bloc/bloc.dart';
import 'package:food_app/core/networking/api_result.dart';
import 'package:food_app/features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
final LoginRepo _loginRepo;

LoginCubit(this._loginRepo) : super(LoginInitial());

Future<void> login({
required String username,
required String password,
}) async {
emit(LoginLoading());

final result = await _loginRepo.login(
username: username,
password: password,
);

switch (result) {
case Success<String>(data: final token):
emit(LoginSuccess(token));

case Error<String>(error: final message):
emit(LoginError(message));
}
}
}

