 
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/widgets/theme_tabs.dart'; 
import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart'; 
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'; 
import 'package:google_fonts/google_fonts.dart';

 
import 'menu_tile.dart';
// Sidebar for mobile and web  mode
class Sidebar extends StatelessWidget {
    Sidebar({super.key});
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: Responsive.isMobile(context) ? double.infinity : null,
      // width: MediaQuery.of(context).size.width < 1300 ? 260 : null,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(  horizontal: AppConstants.padding,
                    vertical: AppConstants.padding * 1.5,),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppConstants.logo, // Replace with your image path
                          height: 48,
                          width: 48,
                        ),
                        AppPadding.paddingW16,
                        Text(
                          'Rent a Car',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color.lerp(AppColors.primaryPurple, AppColors.primary, 0.5),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),AppPadding.paddingH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.padding,
                    ),
                    child: IconButton(
                      onPressed: () {
                         Get.back();
                      },
                      icon: SvgPicture.asset('assets/icons/close_filled.svg'),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.padding,
                    vertical: AppConstants.padding * 1.5,
                  ),
                  child: SvgPicture.asset(AppConstants.logo),
                ),
              ],
            ),
            const Divider(),
            AppPadding.paddingH16,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.padding,
                ),
                child:Obx(() {
                return ListView(
                  children: [
                    MenuTile(
                      isActive: controller.currentPage == DashboardNavigation.dashboard,
                      title: "Home",
                      activeIconSrc: "assets/icons/home_filled.svg",
                      inactiveIconSrc: "assets/icons/home_light.svg",
                      onPressed: () {
                        controller.changePage(DashboardNavigation.dashboard);
                        if (Responsive.isMobile(context)){
                        Get.back();
                        } 
                      },
                    ),
                     MenuTile(
                      isActive: controller.currentPage == DashboardNavigation.vehicule,
                    
                      title: "Vehicules",
                      activeIconSrc: "assets/icons/car.svg",
                      inactiveIconSrc: "assets/icons/car.svg",
                      onPressed: () {
                        controller.changePage(DashboardNavigation.vehicule);
                        if (Responsive.isMobile(context)){
                        Get.back();
                        } 
              },
                    ),
                    ExpansionTile(
                      leading:
                          SvgPicture.asset("assets/icons/diamond_light.svg"),
                      title: Text(
                        "Products",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isSubmenu: true,
                          title: "Dashboard",
                          onPressed: () {},
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Products",
                          count: 16,
                          onPressed: () {},
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Add Product",
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // Customers
                    ExpansionTile(
                      leading: SvgPicture.asset(
                          "assets/icons/reload_light.svg"),
                      title: Text(
                        "Customers",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isSubmenu: true,
                          title: "Dashboard",
                          onPressed: () {},
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Products",
                          count: 16,
                          onPressed: () {},
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Add Product",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    ExpansionTile(
                      leading:
                          SvgPicture.asset("assets/icons/profile_circled_light.svg"),
                      title: Text(
                        "Operations",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isSubmenu: true,
                           activeIconSrc: "assets/icons/reservation_icon.svg",
                          inactiveIconSrc: "assets/icons/reservation_icon.svg",
                          title: "Reservation",
                          onPressed: () {
                            controller.changePage(DashboardNavigation.reservation);
                          },
                        ),
                        MenuTile(
                          isSubmenu: true,
                           activeIconSrc: "assets/icons/restitution_icon.svg",
                      inactiveIconSrc: "assets/icons/restitution_icon.svg",
                          title: "Restitution",
                          count: 16,
                          onPressed: () {
                             controller.changePage(DashboardNavigation.restitution);
                          },
                        ), 
                      ],
                    ),
                  ],
                );
}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.padding),
              child: Column(
                children: [ 
                  //  const CustomerInfo(
                  //     name: 'User',
                  //     email: 'username@email.com',
                  //     imageSrc:
                  //         'https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression',
                  //   ), 
                  AppPadding.paddingH8,
                  const Divider(),
                   AppPadding.paddingH8,
                  Row(
                    children: [
                     Icon(Icons.settings,color: AppColors.textLight,),
                      AppPadding.paddingW8,
                      Text(
                        'Setting',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ), 
                    ],
                  ),
                  AppPadding.paddingH16,
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/help_light.svg',
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textLight,
                          BlendMode.srcIn,
                        ),
                      ),
                      AppPadding.paddingW8,
                      Text(
                        'Help & getting started',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      // Chip(
                      //   backgroundColor: AppColors.secondaryLavender,
                      //   side: BorderSide.none,
                      //   padding: const EdgeInsets.symmetric(horizontal: 0.5),
                      //   label: Text(
                      //     "8",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .labelMedium!
                      //         .copyWith(fontWeight: FontWeight.w700),
                      //   ),
                      // ),
                    ],
                  ),
                  AppPadding.paddingH20,
                  // const ThemeTabs(),
                  AppPadding.paddingH8,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
