 
import 'package:rent_car_dashboard/data/models/chat_item.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/pages/message_web_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/widgets/chat_item.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/menu_tile.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/theme_tabs.dart'; 
import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/ui/widgets/app_logo.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart'; 
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'; 
import 'package:google_fonts/google_fonts.dart';
 
// Sidebar for mobile and web  mode
class ChatsPage extends StatelessWidget {
    ChatsPage({super.key});
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Container( width:    (!Responsive.isMobile(context)) ? 450 : double.infinity, color: Theme.of(context).cardColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const  EdgeInsets.symmetric(  horizontal: AppConstants.padding,
                    vertical: AppConstants.padding * 1.5,),
              child:   Row(
                children: [
                  IconButton(
          icon: Icon(Icons.arrow_back,   color: Theme.of(context).textTheme.bodyLarge!.color),
          onPressed: () =>   Get.toNamed(AppRoutes.home)
        )
        ,AppPadding.paddingW16,
                  Text(
                              "Chats",
                              style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w600),
                            ),
                ],
              ),
            ) ,
     
            const Divider(),
            AppPadding.paddingH16,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.padding,
                ),
                child: 
             ListView(
          children: chatItems.map((chatItem) => ChatItemWidget(chatItem: chatItem)).toList(),
        )
 
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}
class ChatMobilePage
 extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:    (Responsive.isMobile(context)) ? ChatsPage() : MessageWebPage());
  }
}