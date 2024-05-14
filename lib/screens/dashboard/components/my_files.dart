import 'package:dashboard_flutter/constants.dart';
import 'package:flutter/material.dart';
import './info_card.dart';

import 'package:dashboard_flutter/models/MyFiles.dart';


class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key

  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding*1.5,
                    vertical: 10)
              ),
                onPressed: (){},
                icon:Icon(Icons.add),
              label:Text("Add New")

            )
          ],
        ),
        SizedBox(height:defaultPadding),
       FileCard()
      ],
    );
  }
}



class FileCard extends StatelessWidget {
  const FileCard({
    Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,

  }):super(key:key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    // return GridView.builder(
    //   itemCount: 4,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: crossAxisCount
    //
    //   ),
    //     itemBuilder:(context,index)=> InfoCard()
    //
    // );

    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: demoMyFiles.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: crossAxisCount,
    crossAxisSpacing: defaultPadding,
    mainAxisSpacing: defaultPadding,
    childAspectRatio: 1,
    ),
    itemBuilder: (context, index) => InfoCard(info: demoMyFiles[index]),

    );
  }
}

