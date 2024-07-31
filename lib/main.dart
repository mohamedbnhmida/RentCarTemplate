  
import 'package:rent_car_dashboard/ui/theme_controller.dart';
import 'package:rent_car_dashboard/utils/app_navigation.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart'; 
import 'package:rent_car_dashboard/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/utils/app_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

 void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await loadFromSharedPrefs();
  runApp( MainApp());
} 

 Future<void> loadFromSharedPrefs() async { 
   final prefs = await SharedPreferences.getInstance();
   AppVariables.authToken = prefs.getString('authToken') ?? '';
   AppVariables.email = prefs.getString('email') ?? '';
      //  AppVariables.isLoggedIn = prefs.getBool('isLoggedin') ?? true;
   AppVariables.refreshToken = prefs.getString('refreshToken') ?? '';
 } 

class MainApp extends StatelessWidget {
    MainApp({super.key});
  final ThemeController controller = Get.put(ThemeController());

  Widget build(BuildContext context) {
    
     return GetMaterialApp( 
      themeMode: controller.theme,
       theme: AppTheme.light  (context),
       darkTheme:  AppTheme.dark (context),
      initialRoute: AppVariables.isLoggedIn  ? AppRoutes.home : AppRoutes.login,
      getPages: AppNavigation.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
