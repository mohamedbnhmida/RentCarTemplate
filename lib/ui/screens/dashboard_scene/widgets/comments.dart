import 'package:rent_car_dashboard/ui/screens/dashboard_scene/widgets/comment_item.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/ui/widgets/section_title.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

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
              title: "Comments",
              color: AppColors.secondaryPaleYellow,
            ),
          ),
         AppPadding.paddingH16,
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return CommentItem(
                name: 'Jazmyn',
                username: 'jaz.designer',
                time: '1h',
                product: 'Fleet - Travel shopping',
                comment: 'I need react version asap!',
                imageSrc: index == 1
                    ? 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg'
                    : 'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?rs=1&pid=ImgDetMain',
                onProfilePressed: () {},
                onProductPressed: () {},
              );
            },
          ),
          AppPadding.paddingH8,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "View all",
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
