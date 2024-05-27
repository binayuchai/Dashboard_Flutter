import 'package:dashboard_flutter/controller/MenuAppController.dart';
import 'package:dashboard_flutter/models/customUser.dart';
import 'package:dashboard_flutter/screens/authentications/login.dart';
import 'package:dashboard_flutter/screens/authentications/signup_w.dart';
import 'package:dashboard_flutter/screens/main/main_screen.dart';
import 'package:dashboard_flutter/screens/wrapper.dart';
import 'package:dashboard_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import './screens/main/main_screen.dart';
// import './screens/main/sidebar.dart';

import "./screens/main/sidebar.dart";

import 'package:google_fonts/google_fonts.dart';
import './constants.dart';

//
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<CustomUser?>.value(
            value: AuthService().user,
            initialData: null,
          ),
          ChangeNotifierProvider(
            create: (_) => MenuAppController(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Dashboard',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
          ),
         home:const Wrapper(),

          //         home: MultiProvider(
          //           providers: [
          //             ChangeNotifierProvider(create: (context) => MenuAppController())
          //           ],
          //           child:const Wrapper()
          // ),
        ));
  }
}
