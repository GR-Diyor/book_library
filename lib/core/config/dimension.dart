import 'package:book_library/core/config/utill/dimension_utill.dart';
import 'package:flutter/material.dart';

class AppDimension{
  static double height(context)=>MediaQuery.of(context).size.height;
  static double width(context)=>MediaQuery.of(context).size.width;


  static TextTheme textSize(context) => Theme.of(context).textTheme;
  static double largeText(context)=>Theme.of(context).textTheme.labelLarge!.fontSize!;
  static double mediumText(context)=>Theme.of(context).textTheme.labelMedium!.fontSize!;
  static double smallText(context)=>Theme.of(context).textTheme.labelSmall!.fontSize!;





}

extension SizeExtension on num {

  double get h => this * SizerUtil.height / 100;


  double get w => this * SizerUtil.width / 100;

  double get sp => this * (SizerUtil.width / 3) / 100;
}
