import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/ui/widgets/section_title.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetMoreCustomers extends StatelessWidget {
  const GetMoreCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.padding * 1.25),
      decoration:   BoxDecoration(
        
      color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadius),
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: "Get more customers!",
            color: AppColors.secondaryBabyBlue,
          ),
          AppPadding.paddingH20,
          const Text(
            '50% of new customers explore products because the author sharing the work on the social media network. Gain your earnings right now! 🔥',
          ),
          AppPadding.paddingH20,
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/facebook_filled.svg',
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textLight,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) AppPadding.paddingW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Facebook",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
              AppPadding.paddingW16,
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/twitter_light.svg',
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textLight,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) AppPadding.paddingW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Twitter",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
              AppPadding.paddingW16,
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/instagram_light.svg',
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textLight,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) AppPadding.paddingW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Instagram",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
