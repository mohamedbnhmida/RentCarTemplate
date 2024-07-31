import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/ui/widgets/avatar/customer_rounded_avatar.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VehiculesItem extends StatelessWidget {
  const VehiculesItem({
    super.key,
    this.height = 64,
    this.width = 64,
    this.backgroundColor,
    required this.title,
    required this.time,
    required this.iconSrc,
    this.tagStatus = 'New',
    this.tagColor = AppColors.secondaryLavender,
  });

  final double height, width;
  final Color? backgroundColor, tagColor;
  final String title, time, iconSrc;
  final String tagStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              fixedSize: Size(height, width),
              shape: const CircleBorder(),
              backgroundColor: backgroundColor,
            ),
            child: SvgPicture.asset(
              iconSrc,
              height: 24,
              width: 24,
              colorFilter:   ColorFilter.mode(
                 Theme.of(context).iconTheme.color! ,
                BlendMode.srcIn,
              ),
            ),
          ),
          AppPadding.paddingW8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge!.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppPadding.paddingH8,
              Row(
                children: [
                  Chip(
                    backgroundColor: tagColor,
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.padding * 0.25,
                        vertical: AppConstants.padding * 0.125),
                    label: Text(
                      tagStatus,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textTheme.titleSmall?.color),
                    ),
                  ),
                  AppPadding.paddingW4,
                  Container(
                    padding: const EdgeInsets.all(AppConstants.padding * 0.125),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadius * 0.5,
                      ),
                      border: Border.all(
                        color: AppColors.highlightLight,
                      ),
                    ),
                    child: Row(
                      children: [
                        const CustomerRoundedAvatar(
                          height: 20,
                          width: 20,
                          radius: AppConstants.borderRadius * 0.25,
                          imageSrc:
                              'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                        ),
                        AppPadding.paddingW8,
                        Text(time),
                        AppPadding.paddingW8,
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
