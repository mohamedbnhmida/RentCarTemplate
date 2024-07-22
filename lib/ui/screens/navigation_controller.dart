 
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/screens/vehicule_page.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NavigationController extends GetxController {
  final Rx<DashboardNavigation> _currentPage = DashboardNavigation.dashboard.obs;

  DashboardNavigation get currentPage => _currentPage.value;

  void changePage(DashboardNavigation page) {
    _currentPage.value = page;
  }
}