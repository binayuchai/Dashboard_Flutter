import 'package:flutter/material.dart';

import './components/header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Header()
      ],
    );
  }
}
