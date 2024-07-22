import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_car_dashboard/utils/app_extensions.dart'; 
class RestitutionController extends GetxController { 
var isLoading = true.obs; 

 
  @override
  void onInit() {
    super.onInit();
    // Initialize with some cars if needed
      Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    }); 
  }
 
}