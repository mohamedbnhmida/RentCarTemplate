import 'package:rent_car_dashboard/ui/screens/content_area.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/pages/chat_tablet.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/pages/chats_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/pages/message_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/widgets/message_header.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/screens/vehicule_page.dart';
import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/web_sidebar.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/tablet_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 

class MessageWebPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (Responsive.isWeb(context)) ChatsPage(),
          if (Responsive.isTablet(context))  ChatTablet(),
            MessagePage()
        ],
      ),
    );
  }
}