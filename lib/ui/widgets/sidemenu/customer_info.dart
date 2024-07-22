import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/ui/widgets/avatar/customer_rounded_avatar.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({
    super.key,
    required this.name,
    required this.email,
    required this.imageSrc,
  });

  final String name, email, imageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.padding * 0.75),
      decoration: BoxDecoration(
        color: AppColors.bgLight,
        borderRadius: BorderRadius.circular(
          AppConstants.borderRadius * 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomerRoundedAvatar(
                height: 48,
                width: 48,
                imageSrc: imageSrc,
                radius: AppConstants.borderRadius * 10,
              ),
              AppPadding.paddingW16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      email,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              AppPadding.paddingW16,
                 
        ],
      ),
      AppPadding.paddingH16,Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.error, // Red color for the text and icon
          ),
          icon: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: () {
            Navigator.pop(context);
           Get.toNamed(AppRoutes.login);
          },
        ),
            ],
          ),])
    );
  }
}
