import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget web;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.web,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1280 &&
      MediaQuery.of(context).size.width >= 1024;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1280 then we consider it a desktop
    if (size.width >= 1280) {
      return web;
    }
    // If width it less then 1280 and more then 1024 we consider it as tablet
    else if (size.width >= 904 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
