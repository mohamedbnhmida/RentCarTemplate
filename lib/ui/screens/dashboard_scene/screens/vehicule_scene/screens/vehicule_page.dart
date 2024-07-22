

import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/controllers/vehicule_controller.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/popups/add_car_popup.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/dashboard_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/widgets/add_vehicule.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/widgets/vehicules.dart';
import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/ui/widgets/loading_progress.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 import 'dart:async'; 
class VehiculePage extends StatelessWidget {
  const VehiculePage({super.key});

  @override
  Widget build(BuildContext context) {
     final VehiculeController controller = Get.put(VehiculeController());
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.max,
        children: [
         
           if (!Responsive.isMobile(context)) AppPadding.paddingH24,
          Text(
            "Vehicules",
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
              : Vehicules(),
        ),
        ],
       
    );
  }
}

 