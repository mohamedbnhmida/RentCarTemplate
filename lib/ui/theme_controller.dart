import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class ThemeController extends GetxController {
  // Using a reactive variable to hold the current theme mode
  var isDarkTheme = false.obs;

  ThemeMode get theme => isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool isDark) {
    isDarkTheme.value = isDark;
    Get.changeThemeMode(theme);
  }
}