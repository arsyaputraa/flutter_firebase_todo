import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_app/blocs/sign_in/sign_in_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(
                    SignOutRequired(),
                  );
            },
            icon: const Icon(CupertinoIcons.arrow_right_to_line))
      ]),
      body: const Center(
        child: Text('HOME'),
      ),
    );
  }
}
