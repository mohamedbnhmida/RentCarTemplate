
import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import 'icon_tile.dart';
import 'theme_icon_tile.dart';
// SiderBar for Tablet mode 
class TabSidebar extends StatelessWidget {
    TabSidebar({super.key});
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.padding,
                vertical: AppConstants.padding * 1.5),
            child: Image.asset(AppConstants.logo,height: 40,width: 40,),
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
                    isActive: false,
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
          Column(
            children: [
              
              const SizedBox(
                width: 48,
                child: Divider(thickness: 2),
              ),
              IconButton(
          icon: Icon(Icons.settings, color: AppColors.textGrey),
          onPressed: () { 
          },
        ),
              AppPadding.paddingH4,
              IconTile(
                isActive: false,
                activeIconSrc: "assets/icons/help_light.svg",
                onPressed: () {},
              ),
              AppPadding.paddingH4,
              // ThemeIconTile(
              //   isDark: false,
              //   onPressed: () {},
              // ),
              AppPadding.paddingH16,
            ],
          )
        ],
      ),
    );
  }
}
