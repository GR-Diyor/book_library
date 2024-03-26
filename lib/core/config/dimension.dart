import 'package:book_library/core/config/utill/dimension_utill.dart';
import 'package:flutter/material.dart';

class AppDimension{
  static TextTheme textSize(context) => Theme.of(context).textTheme;
  static double LargeText(context)=>Theme.of(context).textTheme.labelLarge!.fontSize!;
  static double MediumText(context)=>Theme.of(context).textTheme.labelMedium!.fontSize!;
  static double SmallText(context)=>Theme.of(context).textTheme.labelSmall!.fontSize!;





}

extension SizeExtension on num {

  double get h => this * SizerUtil.height / 100;


  double get w => this * SizerUtil.width / 100;

  double get sp => this * (SizerUtil.width / 3) / 100;
}
