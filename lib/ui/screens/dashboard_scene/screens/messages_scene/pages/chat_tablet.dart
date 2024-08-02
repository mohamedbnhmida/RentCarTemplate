
import 'package:rent_car_dashboard/data/models/chat_item.dart';
import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/widgets/chat_item.dart';
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
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                        icon: Icon(Icons.arrow_back,   color: Theme.of(context).textTheme.bodyLarge!.color),
                        onPressed: () =>   Get.toNamed(AppRoutes.home)
                      ),
            ),
          AppPadding.paddingH16,
          Expanded(
            child:    ListView(
          children: chatItems.map((chatItem) => ChatItemTablet(chatItem: chatItem)).toList(),
        )
            ),
            

          
        ],
      ),
    );
  }
}
