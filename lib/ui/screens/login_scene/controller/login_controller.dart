import 'package:rent_car_dashboard/data/models/user_getbyemail_model.dart';
import 'package:rent_car_dashboard/data/usecases/login_usecase.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/utils/app_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/app_extensions.dart';
class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginUseCase _loginUseCase = LoginUseCase();
  var user = Rxn<User>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var status = LoginStatus.idle.obs;
  final RxBool obscurePassword = true.obs;
  var isEmailValid = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateEmail(String email) {
    isEmailValid.value = GetUtils.isEmail(email);
  }

  

  

  void login() async {
    bool isPasswordValid = passwordController.text.isNotEmpty;
    String email = emailController.text;
    String password = passwordController.text;
    if (!isEmailValid.value) {
      showSnackbar('Error', 'Please enter a valid email address', SnackbarType.error);
      return;
    }

    if (!isPasswordValid) {
      showSnackbar('Error', 'Password cannot be empty',  SnackbarType.error);
      return;
    }

    try {
      isLoading(true);
      status(LoginStatus.loading);

      user.value = (await _loginUseCase.login(email, password));
      
      status(LoginStatus.success);
      _saveLoginResponse();
      showSnackbar('Success', 'Login Successful',  SnackbarType.success);
      Get.toNamed(AppRoutes.home);
    } catch (e) {
      if (e is Error) {
        errorMessage(e.obs.string);
      } else {
        errorMessage('Login failed');
      }
      status(LoginStatus.error);
      showSnackbar('Error', 'Login Failed',  SnackbarType.error);
    } finally {
      isLoading(false);
    }
  }

  Future<void> _saveLoginResponse() async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('email', user.email);
    await prefs.setString('authToken', AppVariables.authToken);
    await prefs.setString('refreshToken', AppVariables.refreshToken);
 await prefs.setBool('isLoggedin', true);

  }
 
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
    // await prefs.remove('email');
    await prefs.remove('authToken');
    await prefs.remove('refreshToken');
    await prefs.setBool('isLoggedin', false);
    
    user.value = null;
  }
}

enum LoginStatus { idle, loading, success, error }