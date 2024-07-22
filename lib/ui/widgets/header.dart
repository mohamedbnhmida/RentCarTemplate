import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/ui/screens/login_scene/controller/login_controller.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/ui/widgets/avatar/customer_rounded_avatar.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/customer_info.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; 

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_padding.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Header extends StatelessWidget {
    Header({super.key, required this.drawerKey});

  final LoginController controller = Get.put(LoginController());

  final GlobalKey<ScaffoldState> drawerKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.padding, vertical: AppConstants.padding),
      color: AppColors.bgSecondayLight,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if (Responsive.isMobile(context))
              IconButton(
                onPressed: () {
                  drawerKey.currentState!.openDrawer();
                },
                icon: Badge(
                  isLabelVisible: false,
                  child: SvgPicture.asset(
                    "assets/icons/menu_light.svg",
                  ),
                ),
              ),  
              // Expanded(
              //   flex: 3,
              //   child: TextFormField(
              //     // style: Theme.of(context).textTheme.labelLarge,
              //     decoration: InputDecoration(
              //       hintText: "Search...",
              //       prefixIcon: Padding(
              //         padding: const EdgeInsets.only(
              //             left: AppConstants.padding,
              //             right: AppConstants.padding / 2),
              //         child: SvgPicture.asset("assets/icons/search_light.svg"),
              //       ),
              //       filled: true,
              //       fillColor: Theme.of(context).scaffoldBackgroundColor,
              //       border: AppConstants.outlineInputBorder,
              //       focusedBorder: AppConstants.focusedOutlineInputBorder,
              //     ),
              //   ),
              // ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [  
                    IconButton(
                      onPressed: () {Get.toNamed(AppRoutes.messages);},
                      icon: Badge(
                        isLabelVisible: true,
                        child:
                            SvgPicture.asset("assets/icons/message_light.svg"),
                      ),
                    ),
                     if (!Responsive.isMobile(context))
                   AppPadding.paddingW16, 
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.notification);
                        },
                      icon: Badge(
                        isLabelVisible: true,
                        child: SvgPicture.asset(
                            "assets/icons/notification_light.svg"),
                      ),
                    ), 
                    
                     if (Responsive.isMobile(context))
                      AppPadding.paddingW16, 
                    _buildProfileButton(controller)
     
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildProfileButton(LoginController controller) {
    final NavigationController navcontroller = Get.put(NavigationController());

  return PopupMenuButton<int>(
    icon: const CircleAvatar(
      backgroundImage: NetworkImage(
        "https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression",
      ),
    ),
    itemBuilder: (context) => [
      PopupMenuItem<int>(
        value: 1,onTap: (){  
                  navcontroller.changePage(DashboardNavigation.profile);},
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent, // Remove splash color
            highlightColor: Colors.transparent, // Remove highlight color
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CustomerRoundedAvatar(
                  height: 48,
                  width: 48,
                  imageSrc: 'https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression',
                  radius: AppConstants.borderRadius * 10,
                ),
                SizedBox(width: 16), // Adjust as needed for padding
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'username@email.com',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16), // Adjust as needed for padding
              ],
            ),
          ),
        ),
      ),
      PopupMenuItem<int>(
        value: 2,   onTap: () async {
          await controller.logout();
          Navigator.pop(context);
          Get.toNamed(AppRoutes.login);
        },
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent, // Remove splash color
            highlightColor: Colors.transparent, // Remove highlight color
          ),
          child: Row(
            children: [
              AppPadding.paddingW20,
              Icon(Icons.power_settings_new_rounded,color: AppColors.error,),
              AppPadding.paddingW20,
              Text('Logout',style: TextStyle(color: AppColors.error),),
           
            ],
          ),
        ),
      ),
    ],
    color: Colors.white, // Transparent background for the menu
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Rounded corners for the entire menu
    ),
  );
}