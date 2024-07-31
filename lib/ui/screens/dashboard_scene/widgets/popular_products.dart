import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/ui/widgets/section_title.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'popular_product_item.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:   BoxDecoration(
       
      color: Theme.of(context).cardColor,
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
              title: "Popular products",
              color: AppColors.secondaryLavender,
            ),
          ),
          AppPadding.paddingH16,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.padding * 0.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Products', style: Theme.of(context).textTheme.labelSmall),
                Text('Earning', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
          AppPadding.paddingH8,
          const Divider(),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return PopularProductItem(
                name: 'Crypter - NFT UI kit',
                price: '\$2,453.80',
                imageSrc:
                    'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                isActive: index % 2 == 0,
                onPressed: () {},
              );
            },
          ),
          AppPadding.paddingH16,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "All products",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
         AppPadding.paddingH8,
        ],
      ),
    );
  }
}
