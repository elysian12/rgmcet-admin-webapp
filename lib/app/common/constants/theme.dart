import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rgmcet_admin/app/common/constants/text_styles.dart';

import 'colors.dart';
import 'helper.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backGroundColor,
    textTheme: textTheme(),
    fontFamily: Helper.fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      elevation: 0,
      toolbarHeight: 75.h,
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: MyTextStyle.appBarTextStyle,
      actionsIconTheme: IconThemeData(
        color: AppColors.backGroundColor,
      ),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline2: MyTextStyle.heading,
    headline4: MyTextStyle.label,
    headline6: MyTextStyle.buttonStyle,
    bodyText1: MyTextStyle.small,
  );
}
