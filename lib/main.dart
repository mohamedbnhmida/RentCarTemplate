  
import 'package:rent_car_dashboard/utils/app_navigation.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart'; 
import 'package:rent_car_dashboard/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/utils/app_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

 void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  AppVariables.authToken = prefs.getString('authToken') ?? '';
  AppVariables.email = prefs.getString('email') ?? '';
  AppVariables.isLoggedIn = prefs.getBool('isLoggedin') ?? false;
  AppVariables.refreshToken = prefs.getString('refreshToken') ?? '';
  runApp(const MainApp());
} 

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
     return GetMaterialApp( 
       theme: AppTheme.light(context),
      initialRoute: AppVariables.isLoggedIn ? AppRoutes.home : AppRoutes.login,
      getPages: AppNavigation.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
