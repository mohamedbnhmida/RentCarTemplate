import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/restitution_scene/controllers/restitution_controller.dart';
import 'package:rent_car_dashboard/ui/widgets/loading_progress.dart';
import 'package:rent_car_dashboard/ui/widgets/section_title.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/utils/responsive.dart'; 
 
 
 
class RestitutionPage extends StatelessWidget {
  const RestitutionPage({super.key});

  @override
  Widget build(BuildContext context) {
      final RestitutionController controller = Get.put(RestitutionController());

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.max,
        children: [
         
           if (!Responsive.isMobile(context)) AppPadding.paddingH24,
          Text(
            "Restitution",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
           AppPadding.paddingH24,
         Obx(
          () => controller.isLoading.value
              ? Center(
                  child: LoadingProgress(),
                )
              : Container(
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
                title: "Liste de Restitution",
                color: AppColors.secondaryLavender,
              ),
           
          AppPadding.paddingH20, 
          AppPadding.paddingH20, 
          Icon(Icons.abc,size: 300,)
        ],
      ),
    ),
        ),
        ],
       
    );
  }
}
 