import 'package:dashboard_flutter/models/customUser.dart';
import 'package:dashboard_flutter/screens/authentications/login.dart';
import 'package:dashboard_flutter/screens/authentications/signup_w.dart';
import 'package:dashboard_flutter/screens/dashboard/dashboard_screen.dart';
import 'package:dashboard_flutter/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_flutter/controller/MenuAppController.dart';



// This widget returns either Dashboard Screen or Authenticate widget

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    print("THis is --------------> ${user}");

    //check either Home or Authenticate widget

    if (user == null){

      return LoginWidget();

    }
    else{
      return MainScreen();
    }

  }
}
