import 'package:dashboard_flutter/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';



// This widget returns either Dashboard Screen or Authenticate widget

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen();
  }
}
