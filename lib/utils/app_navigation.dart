 
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/pages/message_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/notification_scene/pages/notification.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/profile_scene/pages/profile_page.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:get/get.dart';

import '../ui/screens/register_scene/pages/register_page.dart';
import '../ui/screens/login_scene/pages/sign_in_page.dart';
import '../ui/screens/home_page.dart';
// 

class AppNavigation {
  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.home, page: () =>   HomePage()),
    GetPage(name: AppRoutes.login, page: () =>   SignInPage()),
    GetPage(name: AppRoutes.register, page: () =>   RegisterPage()),
    GetPage(name: AppRoutes.notification, page: () =>   NotificationScreen()),
    GetPage(name: AppRoutes.messages, page: () =>   MessagePage()),
    GetPage(name: AppRoutes.profile, page: () =>   ProfilePage()), 
 
  ];

}