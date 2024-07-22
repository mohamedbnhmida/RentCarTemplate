import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.bgLight,
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.bgSecondayLight,
        surfaceTintColor: AppColors.bgSecondayLight,
      ),
      primaryColor: AppColors.primary,
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(
              bodyColor: AppColors.titleLight,
              displayColor: AppColors.titleLight)
          .copyWith(
            bodyLarge: const TextStyle(color: AppColors.textLight),
            bodyMedium: const TextStyle(color: AppColors.textLight),
            bodySmall: const TextStyle(color: AppColors.textLight),
          ),
      iconTheme: const IconThemeData(color: AppColors.iconLight),
      dividerColor: AppColors.highlightLight,
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: AppColors.highlightLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 56),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstants.borderRadius),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.titleLight,
          minimumSize: const Size(100, 56),
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.padding, vertical: AppConstants.padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          side: BorderSide(color: AppColors.highlightLight, width: 2),
        ),
      ),
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
      expansionTileTheme:
          const ExpansionTileThemeData(shape: const RoundedRectangleBorder()),
      badgeTheme:
          BadgeThemeData(backgroundColor: AppColors.error, smallSize: 8),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.bgDark,
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.bgSecondayDark,
        surfaceTintColor: AppColors.bgSecondayDark,
      ),
      primaryColor: AppColors.primary,
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(
              bodyColor: AppColors.titleDark,
              displayColor: AppColors.titleDark)
          .copyWith(
            bodyLarge: const TextStyle(color: AppColors.textDark),
            bodyMedium: const TextStyle(color: AppColors.textDark),
            bodySmall: const TextStyle(color: AppColors.textDark),
          ),
      iconTheme: const IconThemeData(color: AppColors.iconDark),
      dividerColor: AppColors.highlightDark,
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: AppColors.highlightDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 56),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstants.borderRadius),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.titleDark,
          minimumSize: const Size(100, 56),
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.padding, vertical: AppConstants.padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          side: BorderSide(color: AppColors.highlightDark, width: 2),
        ),
      ),
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
      expansionTileTheme:
          const ExpansionTileThemeData(shape: const RoundedRectangleBorder()),
      badgeTheme:
          BadgeThemeData(backgroundColor: AppColors.error, smallSize: 8),
    );
  }
}

class AppTextFormFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.textLight,

    suffixIconColor: AppColors.textLight,
    fillColor: AppColors.bgLight,
    filled: true,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(color: AppColors.titleLight),
    hintStyle: const TextStyle(
      fontSize: 14.0,
    ).copyWith(color: AppColors.textGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),

    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.iconGrey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.textLight,
    suffixIconColor: AppColors.textLight,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(color: AppColors.titleLight),
    hintStyle: const TextStyle().copyWith(color: AppColors.textGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.textLight),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.iconLight),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppConstants.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );
}
