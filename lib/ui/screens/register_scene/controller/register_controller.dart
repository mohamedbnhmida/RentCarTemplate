import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/data/models/user_save_model.dart';
import 'package:rent_car_dashboard/data/usecases/registration_usecase.dart';
import 'package:rent_car_dashboard/utils/app_extensions.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';  

enum RegistrationStatus { idle, loading, success, error }

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final RegistrationUseCase _registrationUseCase = RegistrationUseCase();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var status = RegistrationStatus.idle.obs;
  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;
  var isEmailValid = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void validateEmail(String email) {
    isEmailValid.value = GetUtils.isEmail(email);
  }
 
  void register() async {
    bool isPasswordValid = passwordController.text.length >= 6;
    bool isConfirmPasswordValid = passwordController.text == confirmPasswordController.text;
    bool isNameValid = nameController.text.isNotEmpty;

    if (!isEmailValid.value) {
      showSnackbar('Error', 'Please enter a valid email address',SnackbarType.error);
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

    // All fields are valid, proceed with registration
    final email = emailController.text;
    final userName = nameController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    try {
      isLoading(true);
      status(RegistrationStatus.loading);
      await _registrationUseCase.register(
        UserSaveModel(
          firstName: "firstName",
          lastName: "lastName",
          email: email,
          userName: userName,
          password: password,
          confirmPassword: confirmPassword,
          phoneNumber: "phoneNumber",
          activateUser: true,
          autoConfirmEmail: true,
        ),
      );
      status(RegistrationStatus.success);
      showSnackbar('Success', 'Registration Successful',  SnackbarType.success);
      Get.toNamed(AppRoutes.login);
    } catch (e) {
      errorMessage(e.toString());
      status(RegistrationStatus.error);
      showSnackbar('Error', 'Registration Error',  SnackbarType.error);
    } finally {
      isLoading(false);
    }
  }
}