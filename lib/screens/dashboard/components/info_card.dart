import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dashboard_flutter/models/MyFiles.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key ? key,
    required this.info,
  }):super(key: key);
  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration:BoxDecoration(
        color:secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height:60,
                width:60,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child:SvgPicture.asset(

                  // info.svgSrc!   or

                  // we can give default value incase of null so to avoid runtime errors
                    info.svgSrc ?? 'assets/images/icons8-google-drive.svg',
                  // colorFilter: ColorFilter.mode(Colors.black),


                )


              ),
              Icon(
                  Icons.more_vert,
                  color:Colors.white


              )
            ],
          ),
           Text(
             info.title!,
          // maxLines: 1,  by setting the text overflow will be horizontal(ie. scroll horizontallY)
            overflow: TextOverflow.ellipsis,  // when horizontall overflow happens it hide the remaining text by setting
                                             // this text is large and cover space -> this text is large.......

          ),
          ProgressLine(
            color:Colors.white,
            percentage: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(
               "${info.numOfFiles!} Files",
               style: Theme.of(context)
                   .textTheme
                   .bodySmall!
                   .copyWith(color:Colors.white),
             ),
             Text(
               info.totalStorage!,
               style: Theme.of(context)  // retrieves the current 'ThemeData' object
                   .textTheme
                   .bodySmall!
                   .copyWith(color:Colors.white),
             )

           ]

          )
          
        ],
      ),
    );
  }
}


//Progress Bar
class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }):super(key: key);
  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(  // used for laying widget on the top of on another or can be positioned freely unlike column lays linearly

      children: <Widget>[
        Container(
          width:double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color:color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),

        ),
        LayoutBuilder(  // using layoutBuilder , it provides properties like constraints
           //            where child can occupy the available space

            builder: (context,constraints) => Container(
              width:constraints.maxWidth * (percentage! / 100), // it tells max width child occupy according to given percentage 
              height: 5,
              decoration: BoxDecoration(
                color:color,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ))


      ],
    );

  }
}





