import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;


  void controlMenu() {
    //check if currentState is not null
    if (_scaffoldKey.currentState != null) {
      if (!_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.openDrawer();
      }
    }else{
      //handle the case when currentState is null
      print('Scaffold state is null');
    }
  }
}







