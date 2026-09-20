
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/routes/app_routes.dart';
import 'package:food_app/features/login/representation/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

@override
State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final usernameController = TextEditingController();
final passwordController = TextEditingController();

@override
void dispose() {
usernameController.dispose();
passwordController.dispose();
super.dispose();
}

void _login() {
context.read<LoginCubit>().login(
username: usernameController.text.trim(),
password: passwordController.text,
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Food App Login'),
),
body: Padding(
padding: const EdgeInsets.all(20),
child: BlocConsumer<LoginCubit, LoginState>(
listener: (context, state) {
if (state is LoginSuccess) {
Navigator.pushReplacementNamed(
context,
AppRoutes.homeScreen,
);
}

if (state is LoginError) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(state.message),
),
);
}
},
builder: (context, state) {
final isLoading = state is LoginLoading;

return Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
'Welcome to Food App',
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 30),
TextField(
controller: usernameController,
decoration: const InputDecoration(
labelText: 'Username',
border: OutlineInputBorder(),
),
),
const SizedBox(height: 15),
TextField(
controller: passwordController,
obscureText: true,
decoration: const InputDecoration(
labelText: 'Password',
border: OutlineInputBorder(),
),
),
const SizedBox(height: 20),
SizedBox(
width: double.infinity,
height: 50,
child: ElevatedButton(
onPressed: isLoading ? null : _login,
child: isLoading
? const CircularProgressIndicator()
    : const Text('Login'),
),
),
const SizedBox(height: 15),
TextButton(
onPressed: () {
Navigator.pushNamed(
context,
AppRoutes.registerScreen,
);
},
child: const Text('Create an account'),
),
const SizedBox(height: 10),
const Text(
'Username: emilys\nPassword: emilyspass',
textAlign: TextAlign.center,
),
],
);
},
),
),
);
}
}

