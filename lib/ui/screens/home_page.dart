import 'package:rent_car_dashboard/ui/screens/content_area.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/screens/vehicule_page.dart';
import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/sidebar.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/tab_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/header.dart';
import 'dashboard_scene/dashboard_page.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Responsive.isMobile(context) ? Sidebar() : null,
      body: Row(
        children: [
          if (Responsive.isWeb(context)) Sidebar(),
          if (Responsive.isTablet(context))  TabSidebar(),
          Expanded(
            child: Column(
              children: [
                Header(drawerKey: _drawerKey),
                ContentArea() 
              ],
            ),
          ),
        ],
      ),
    );
  }
}