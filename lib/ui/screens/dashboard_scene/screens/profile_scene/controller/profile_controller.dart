import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_car_dashboard/utils/app_extensions.dart'; 

class ProfileController extends GetxController {
  var imageFile = Rx<File?>(null);
  var webImage = Rx<Uint8List?>(null);

  final ImagePicker _picker = ImagePicker();
var isLoading = true.obs;
  var isEditing = false.obs;

  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }

 
  @override
  void onInit() {
    super.onInit();
    // Initialize with some cars if needed
      Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    }); 
  }

  Future<void> pickImage() async {
    if (kIsWeb) {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final Uint8List webFile = await pickedFile.readAsBytes();
        webImage.value = webFile;
      }
    } else {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      }
    }
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  var isEmailValid = false.obs;

  void validateEmail(String email) {
    isEmailValid.value = GetUtils.isEmail(email);
  }
 
  void save() {
    bool isPasswordValid = passwordController.text.length >= 6;
    bool isConfirmPasswordValid = passwordController.text == confirmPasswordController.text;
    bool isNameValid = nameController.text.isNotEmpty;

    if (!isEmailValid.value) {
      showSnackbar('Error', 'Please enter a valid email address',  SnackbarType.error);
      return;
    }

    if (!isNameValid) {
      showSnackbar('Error', 'Name cannot be empty',  SnackbarType.error);
      return;
    }

    if (!isPasswordValid) {
      showSnackbar('Error', 'Password must be at least 6 characters',  SnackbarType.error);
      return;
    }

    if (!isConfirmPasswordValid) {
      showSnackbar('Error', 'Passwords do not match',  SnackbarType.error);
      return;
    }

    showSnackbar('Success', 'Updates Saved!',  SnackbarType.success);
    Get.back();
  }
}