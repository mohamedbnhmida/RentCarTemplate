
import 'package:flutter/material.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
            AppConstants.loader,
            width: 200, // Set width and height as needed
            height: 50,
          );
  }
}