
import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/ui/theme_controller.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/icon_tile.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
 
// SiderBar for Tablet mode 
class ChatTablet extends StatelessWidget {
    ChatTablet({super.key});
  final NavigationController controller = Get.put(NavigationController());
 final ThemeController themecontroller = Get.put(ThemeController()); // Initialize the theme controller

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.padding,
                vertical: AppConstants.padding * 1.5),
            child: Container(
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
  child: CircleAvatar(
    backgroundColor: Colors.white,
    radius: 25, // Adjust radius to fit the image
    child: Image.asset(
      AppConstants.logo, // Replace with your image path
      height: 30,
      width: 30 ,
    ),
  ),
),
          ),
          AppPadding.paddingH16,
          Expanded(
            child: SizedBox(
              width: 48,
              child:Obx(() {
                return ListView(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconTile(
                    isActive: controller.currentPage == DashboardNavigation.dashboard,
                    activeIconSrc: "assets/icons/home_filled.svg",
                    inactiveIconSrc: "assets/icons/home_light.svg",
                    onPressed: () {
                      controller.changePage(DashboardNavigation.dashboard);
                    },
                  ),
                  AppPadding.paddingH4,
                  IconTile(
                    isActive: controller.currentPage == DashboardNavigation.vehicule,
                    activeIconSrc: "assets/icons/car.svg",
                    inactiveIconSrc: "assets/icons/car.svg",
                    onPressed: () {
                         controller.changePage(DashboardNavigation.vehicule); 
                    },
                  ),

                  AppPadding.paddingH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: "assets/icons/diamond_filled.svg",
                    inactiveIconSrc: "assets/icons/diamond_light.svg",
                    onPressed: () {
                      
                    },
                  ),
                  AppPadding.paddingH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: "assets/icons/profile_circled_filled.svg",
                    inactiveIconSrc: "assets/icons/profile_circled_light.svg",
                    onPressed: () {},
                  ),
                  AppPadding.paddingH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: "assets/icons/store_light.svg",
                    inactiveIconSrc: "assets/icons/store_filled.svg",
                    onPressed: () {},
                  ),
                  
                  AppPadding.paddingH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: "assets/icons/promotion_filled.svg",
                    inactiveIconSrc: "assets/icons/promotion_light.svg",
                    onPressed: () {},
                  ),
                   AppPadding.paddingH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: "assets/icons/reservation_icon.svg",
                    inactiveIconSrc: "assets/icons/reservation_icon.svg",
                    onPressed: () {},
                  ),
                   AppPadding.paddingH4,
                  IconTile(
                    isActive: controller.currentPage == DashboardNavigation.restitution,
                    activeIconSrc: "assets/icons/restitution_icon.svg",
                    inactiveIconSrc: "assets/icons/restitution_icon.svg",
                    onPressed: () {
                       controller.changePage(DashboardNavigation.restitution);
                    },
                  ),
                ],
              );
}),
            ),
          ), 
        ],
      ),
    );
  }
}
