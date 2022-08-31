import 'package:flutter/material.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_const.dart';

class AppTextStyle {
  static TextStyle normalText = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 16,
    fontFamily: AppConst.fontFamily,
  );
  static TextStyle regularText = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 12,
    fontFamily: AppConst.fontFamily,
  );
  static TextStyle regularText16 = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 16,
    fontFamily: AppConst.fontFamily,
  );
  static TextStyle regularText14 = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 14,
    fontFamily: AppConst.fontFamily,
  );
  static TextStyle mediumText = const TextStyle(
    color: AppColor.endGradient,
    fontSize: 16,
    fontFamily: AppConst.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mediumTextSmall = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 12,
    fontFamily: AppConst.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mediumTextWhite = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 16,
    fontFamily: AppConst.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle semiBold = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 16,
    fontFamily: AppConst.fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle tempText = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 72,
    fontFamily: AppConst.fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle normalBold = const TextStyle(
    color: AppColor.whiteColor,
    fontSize: 16,
    fontFamily: AppConst.fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle grayBlueText12 = const TextStyle(
    color: AppColor.grayBlueText,
    fontSize: 12,
    fontFamily: AppConst.fontFamily,
  );
}
