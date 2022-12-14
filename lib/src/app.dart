import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/src/bloc/authentication/authentication_cubit.dart';
import 'package:notesapp/src/pages/home_page.dart';
import 'package:notesapp/src/pages/login_page.dart';
import 'package:notesapp/src/pages/signup_page.dart';
import 'package:notesapp/src/pages/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blue
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
