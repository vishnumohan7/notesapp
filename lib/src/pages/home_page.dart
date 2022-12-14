import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/src/bloc/authentication/authentication_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthenticationCubit(),
  child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(32, 29, 43, 1),
        title: Text(
          "notes",
          style: GoogleFonts.montserratAlternates(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white54,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white54,
              ))
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(32, 29, 43, 1),
              ),
              child: Column(
                children: [

                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromRGBO(111, 111, 200, 1)),
          )
        ],
      ),
    ),
);
  }


}
