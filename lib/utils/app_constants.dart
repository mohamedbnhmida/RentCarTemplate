import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String logo = "assets/logo/logo.png";
static const String loader = "assets/gif/loader.gif";

  static const double padding = 16.0;
  static const double borderRadius = 8.0;
  static const double inputFieldRadius = 12.0;
  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppConstants.borderRadius),
      ),
      borderSide: BorderSide.none);
  static OutlineInputBorder focusedOutlineInputBorder = outlineInputBorder
      .copyWith(borderSide: BorderSide(width: 2, color: AppColors.primary));
  static const int connectionTimeout = 5000; // example value in milliseconds
  static const int receiveTimeout = 3000; // example value in milliseconds
}
 