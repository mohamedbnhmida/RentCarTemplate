import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/popups/add_car_popup.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/widgets/add_vehicule.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/widgets/list_car_widget.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/widgets/tips_item.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/ui/widgets/section_title.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
 
class Vehicules extends StatelessWidget {
  const Vehicules({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.padding),
      decoration:  BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding.paddingH8,
           const SectionTitle(
                title: "Vehicules",
                color: AppColors.iconGrey,
              ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
               Expanded(
                flex: 3,
                child: TextFormField(
                  // style: Theme.of(context).textTheme.labelLarge,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: AppConstants.padding,
                          right: AppConstants.padding / 2),
                      child: SvgPicture.asset("assets/icons/search_light.svg"),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    border: AppConstants.outlineInputBorder,
                    focusedBorder: AppConstants.focusedOutlineInputBorder,
                  ),
                ),
              ),
              AddVehicleButton( onPressed: () {
                Get.dialog(AddCarPopup());
                },),
            ],
          ),
          AppPadding.paddingH20,
          Text(
            'Vehicules List',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          AppPadding.paddingH20,
         ListCar()
        ],
      ),
    );
  }
}
