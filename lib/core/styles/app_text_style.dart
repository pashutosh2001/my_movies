import 'package:flutter/material.dart';
import 'package:my_movies/core/styles/app_colors.dart';

mixin AppTextStyle {
  /// regular styles
  static TextStyle textXSregular = const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 12,
    color: AppColors.black0C212C,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textSMregular = const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 14,
    color: AppColors.black0C212C,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textMDregular = const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 16,
    color: AppColors.black0C212C,
    fontWeight: FontWeight.w400,
  );

  /// medium styles
  static TextStyle textXSmedium = const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 12,
    color: AppColors.black101828,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textSMmedium = const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 14,
    color: AppColors.black0C212C,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textMDmedium = const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 16,
    color: AppColors.black0C212C,
    fontWeight: FontWeight.w500,
  );

  /// semibold styles
  static TextStyle textXSsemibold = const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 12,
    color: AppColors.black0C212C,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textSMsemibold = const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 14,
    color: AppColors.black0C212C,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textMDsemibold = TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontSize: 16,
    color: AppColors.black0C212C,
    fontWeight: FontWeight.w600,
  );
}
