import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

extension ToColorFilter on Color {
  ColorFilter? get toColorFilter {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}
SnackPosition getSnackPosition() {
    if (Get.width > 1024) {
      return SnackPosition.TOP;
    } else {
      return SnackPosition.BOTTOM;
    }
  }
  enum SnackbarType {error,success,warning,info}
void showSnackbar(String title, String message, SnackbarType type) {
  Color backgroundColor;
  IconData iconData;

  switch (type) {
    case SnackbarType.error:
      backgroundColor = Colors.red;
      iconData = Icons.cancel_rounded;
      break;
    case SnackbarType.success:
      backgroundColor = Colors.green;
      iconData = Icons.check_circle;
      break;
    case SnackbarType.warning:
      backgroundColor = Colors.yellow[700]!;
      iconData = Icons.warning;
      break;
    case SnackbarType.info:
      backgroundColor = Colors.blue;
      iconData = Icons.info;
      break;
  }

  Color textColor = Get.isDarkMode ? Colors.white : Colors.black;
  Color snackBackgroundColor = Get.isDarkMode ? Colors.grey[850]!.withOpacity(0.7) : Colors.white;

  Get.snackbar(
    title,
    message,
    backgroundColor: snackBackgroundColor,
    colorText: textColor,
    snackStyle: SnackStyle.FLOATING,
    borderRadius: 15,
    boxShadows: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 1,
        offset: Offset(1, 1),
        spreadRadius: 0,
      )
    ],
    snackPosition: getSnackPosition(),
    maxWidth: 400,
    margin: EdgeInsets.all(20),
    icon: Icon(
      iconData,
      color: backgroundColor,
    ),
    duration: Duration(seconds: 1),
  );
}