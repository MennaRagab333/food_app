import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/di/service_locator.dart';

import '../cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Account'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<RegisterCubit>().register();
            },
            child: const Text('Register'),
          ),
        ),
      ),
    );
  }
}