import 'package:dashboard_flutter/constants.dart';
import 'package:flutter/material.dart';




class CloudStorageInfo{
  final String? svgSrc,title, totalStorage;  // ? Indicates that variable can be nullable or type of String

  final int? numOfFiles, percentage;
  final Color? color;
     CloudStorageInfo({
    this.svgSrc,
     this.title,
     this.percentage,
     this.color,
     this.numOfFiles,
     this.totalStorage
     });

}

List demoMyFiles = [
CloudStorageInfo(
  title: 'Documents',
  numOfFiles: 12323,
  percentage: 20,
  svgSrc: "assets/images/icons8-docs.svg",
  color: primaryColor,
  totalStorage: "1.9GB"
),
  CloudStorageInfo(
      title: 'Google Drive',
      numOfFiles: 12300,
      percentage: 20,
      svgSrc: "assets/images/icons8-google-drive.svg",
      color: primaryColor,
      totalStorage: "1.2GB"
  ),
  CloudStorageInfo(
      title: 'One Drive',
      numOfFiles: 12332,
      percentage: 20,
      svgSrc: "assets/images/icons8-onedrive.svg",
      color: primaryColor,
      totalStorage: "1.6GB"
  ),
  CloudStorageInfo(
      title: 'Google Drive',
      numOfFiles: 12373,
      percentage: 20,
      svgSrc: "assets/images/icons8-google-drive.svg",
      color: primaryColor,
      totalStorage: "2GB"
  ),

];