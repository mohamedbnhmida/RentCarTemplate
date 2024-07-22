
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/dashboard_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/profile_scene/pages/profile_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/restitution_scene/pages/restitution_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/screens/vehicule_page.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';

class ContentArea extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1360),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding * (Responsive.isMobile(context) ? 1 : 1.5),
              ),
              child: SafeArea(child: Obx(() {
                    switch (Get.find<NavigationController>().currentPage) {
                      case DashboardNavigation.dashboard:
                        return DashboardPage();
                      case DashboardNavigation.vehicule:
                        return VehiculePage(); 
                         case DashboardNavigation.profile:
                        return ProfilePage(); 
                         case DashboardNavigation.reservation:
                        return ProfilePage(); 
                         case DashboardNavigation.restitution:
                        return RestitutionPage(); 
                      default:
                        return Container();  
                    }
                  }),),
            ),
          ],
        ),
      ),
    );
  }
}
