import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/src/bloc/authentication/authentication_cubit.dart';
import 'package:notesapp/src/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool? isCheckBoxSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthenticationCubit(),
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromRGBO(32, 29, 43, 1)),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome  back! Please login \n           to your account",
                      style:
                      GoogleFonts.inter(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          filled: true,
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(7))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          filled: true,
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(7))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      listener: (context, state) {
                        if (state is AuthenticationSuccess) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()));
                        } else if (state is AuthenticationError) {
                          String errorMessage = state.errorMessage;
                          showDialog(
                              context: context,
                              builder: (
                                  _,
                                  ) {
                                return AlertDialog(
                                  title: const Text("Login Failed"),
                                  content: Text("$errorMessage"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok"))
                                  ],
                                );
                              });
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthenticationLoading) {
                          return Center(child: CupertinoActivityIndicator());
                        }
                        return ElevatedButton(
                            onPressed: () {
                              context.read<AuthenticationCubit>().loginUser(
                                  _emailController.text.trim(),
                                  _passwordController.text);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    Color.fromRGBO(111, 111, 200, 1))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 105.0, right: 105, top: 15, bottom: 15),
                              child: Text(
                                "Login",
                                style: GoogleFonts.inter(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
