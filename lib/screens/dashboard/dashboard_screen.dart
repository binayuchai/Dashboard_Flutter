import 'package:dashboard_flutter/constants.dart';
import 'package:dashboard_flutter/screens/dashboard/components/recent_files.dart';
import 'package:dashboard_flutter/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

import './components/header.dart';
import './components/my_files.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),

              MyFiles(),
             SizedBox(height: defaultPadding),
              RecentFiles(),
              SizedBox(height: defaultPadding),
              StorageDetails(),
            ],
          )



      )











    );

  }
}
