
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/networking/api_result.dart';
import 'package:food_app/features/register/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
final RegisterRepo _registerRepo;

RegisterCubit(this._registerRepo) : super(RegisterInitial());

Future<void> register({
required String name,
required String email,
required String password,
}) async {
emit(RegisterLoading());

final result = await _registerRepo.register(
name: name,
email: email,
password: password,
);

switch (result) {
case Success<String>():
emit(RegisterSuccess());

case Error<String>(error: final message):
emit(RegisterError(message));
}
}
}

