import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/src/bloc/authentication/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/src/models/user_model.dart';
import 'package:notesapp/src/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(32, 29, 43, 1)
              ),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    "Signup",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w500),
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

                  // Row(
                  //   children: [
                  //     Checkbox(
                  //         value: isCheckBoxSelected,
                  //         onChanged: (isSelected) {
                  //           setState(() {
                  //             isCheckBoxSelected = isSelected;
                  //           });
                  //         }),
                  //     Text(
                  //       "Remember Me",
                  //       style: GoogleFonts.inter(
                  //           fontSize: 18, color: Colors.white),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  BlocConsumer<AuthenticationCubit, AuthenticationState>(
                    listener: (context, state) {
                      if (state is AuthenticationSuccess) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => LoginPage()));
                      } else if (state is AuthenticationError) {
                        // String errorMessage = state.errorMessage;
                        showDialog(
                            context: context,
                            builder: (
                                _,
                                ) {
                              return AlertDialog(
                                title: const Text("Signup Failed"),
                                content: Text("errorMessage"),
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
                            UserModel user = UserModel(
                                email: _emailController.text,
                                password: _passwordController.text);
                            context.read<AuthenticationCubit>().createUser(user);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(
                                  Color.fromRGBO(111, 111, 200, 1))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 100.0, right: 100, top: 15, bottom: 15),
                            child: Text(
                              "Signup",
                              style: GoogleFonts.inter(
                                  color: Colors.white, fontSize: 16),
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
    );
  }
}
