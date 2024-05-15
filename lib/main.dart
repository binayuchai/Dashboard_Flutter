import 'package:dashboard_flutter/controller/MenuAppController.dart';
import 'package:dashboard_flutter/screens/authentications/login.dart';
import 'package:dashboard_flutter/screens/authentications/signup_w.dart';
import 'package:dashboard_flutter/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import './screens/main/main_screen.dart';
// import './screens/main/sidebar.dart';
import 'package:provider/provider.dart';

import "./screens/main/sidebar.dart";

import 'package:google_fonts/google_fonts.dart';
import './constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,

        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor:Colors.white),

      ),

      home: LoginWidget(),
      // home: MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (context) => MenuAppController())
      //   ],
      //   child:const MainScreen()
      // ),

    );
  }
}