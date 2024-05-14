import 'package:dashboard_flutter/constants.dart';
import 'package:dashboard_flutter/screens/dashboard/components/chart.dart';
import 'package:flutter/material.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Storage Details",
            style:Theme.of(context).textTheme.titleMedium),
          SizedBox(height:defaultPadding),
          ChartGraph(),
 
        ],
      )
    );
  }
}
