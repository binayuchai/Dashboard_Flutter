import 'package:dashboard_flutter/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import './sidebar.dart';
import 'package:dashboard_flutter/controller/MenuAppController.dart';
import 'package:provider/provider.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:context.read<MenuAppController>().scaffoldKey,
        drawer:const SideMenu(),
        body:const SafeArea(
         child:Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Expanded(
               flex:1,
                 child: DashboardScreen())
           ],
         )
        ),



    );
  }
}