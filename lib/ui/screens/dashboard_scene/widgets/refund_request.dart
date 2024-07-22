import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/ui/widgets/section_title.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RefundRequest extends StatelessWidget {
  const RefundRequest({
    super.key,
    required this.newRefund,
    required this.totalRefund,
  });

  final int totalRefund, newRefund;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadius),
        ),
      ),
      padding: const EdgeInsets.all(AppConstants.padding * 0.75),
      child: Column(
        children: [
          AppPadding.paddingH8,
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.padding * 0.5,
            ),
            child: SectionTitle(
              title: "Refund requests",
              color: AppColors.secondaryPeach,
            ),
          ),
          AppPadding.paddingH24,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.padding * 0.5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.secondaryMistyrose,
                  child: SvgPicture.asset(
                    'assets/icons/basket_light.svg',
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.error,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                AppPadding.paddingW8,
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "You have ",
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.textGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "$totalRefund open refund requests",
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: " to action. This includes ",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "$newRefund new requests.",
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: " 👀",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppPadding.paddingH24,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "Review refund requests",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          AppPadding.paddingH8,
        ],
      ),
    );
  }
}
