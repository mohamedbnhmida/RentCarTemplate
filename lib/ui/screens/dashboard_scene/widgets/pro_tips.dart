import 'package:rent_car_dashboard/ui/screens/dashboard_scene/widgets/tips_item.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/ui/widgets/section_title.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

final List<VehiculesItem> proTipsDummyData = [
  const VehiculesItem(
    title: 'Early access',
    time: '3 mins read',
    iconSrc: 'assets/icons/schedule_light.svg',
  ),
  const VehiculesItem(
    title: 'Asset use guidelines',
    time: 'Time',
    iconSrc: 'assets/icons/arrow_forward_light.svg',
    backgroundColor: AppColors.highlightLight,
  ),
  const VehiculesItem(
    title: 'Exclusive downloads',
    time: '2 mins read',
    iconSrc: 'assets/icons/design_light.svg',
  ),
  const VehiculesItem(
    title: 'Behind the scenes',
    time: '3 mins read',
    iconSrc: 'assets/icons/video_recorder_light.svg',
  ),
  const VehiculesItem(
    title: 'Asset use guidelines',
    time: '1 mins read',
    iconSrc: 'assets/icons/phone_call_incoming_light.svg',
  ),
  const VehiculesItem(
    title: 'Life & work updates',
    time: '3 mins read',
    iconSrc: 'assets/icons/multiselect_light.svg',
  ),
];

class ProTips extends StatelessWidget {
  const ProTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.padding),
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding.paddingH8,
          const SectionTitle(
            title: "Pro tips",
            color: AppColors.secondaryMintGreen,
          ),
          AppPadding.paddingH20,
          Text(
            'Need some ideas for the next product?',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          AppPadding.paddingH20,
          GridView.builder(
            itemCount: proTipsDummyData.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: Responsive.isMobile(context) ? 560 : 410,
              mainAxisExtent: 80,
              crossAxisSpacing: AppConstants.padding,
              mainAxisSpacing: AppConstants.padding,
            ),
            itemBuilder: (context, index) => proTipsDummyData[index],
          ),
        ],
      ),
    );
  }
}
