import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'helper.dart';

class MyTextStyle {
  static TextStyle get appBarTextStyle => TextStyle(
        color: AppColors.backGroundColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        fontFamily: Helper.fontFamily,
      );
  static TextStyle get heading => TextStyle(
        color: AppColors.primaryColor,
        fontSize: 28.sp,
        fontWeight: FontWeight.w500,
        fontFamily: Helper.fontFamily,
      );
  static TextStyle get label => TextStyle(
        color: AppColors.labelColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: Helper.fontFamily,
      );
  static TextStyle get buttonStyle => TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: Helper.fontFamily,
      );
  static TextStyle get hintStyle => TextStyle(
        color: AppColors.hintColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: Helper.fontFamily,
      );
  static TextStyle get small => TextStyle(
        color: AppColors.labelColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: Helper.fontFamily,
      );
}
