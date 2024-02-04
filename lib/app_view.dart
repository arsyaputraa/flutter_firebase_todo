import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_app/blocs/sign_in/sign_in_bloc.dart';
import 'package:flutter_firebase_app/screens/auth/auth_screen.dart';
import 'package:flutter_firebase_app/screens/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            background: Colors.white,
            onBackground: Colors.black,
            primary: Colors.teal,
            onPrimary: Colors.white,
            secondary: Color.fromARGB(255, 22, 58, 77),
            onSecondary: Colors.grey.shade100,
            tertiary: Colors.indigo,
            onTertiary: Colors.white,
            error: Colors.red,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          )),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            return BlocProvider<SignInBloc>(
              create: (context) => SignInBloc(
                userRepository: context.read<AuthBloc>().userRepository,
              ),
              child: const HomeScreen(),
            );
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
