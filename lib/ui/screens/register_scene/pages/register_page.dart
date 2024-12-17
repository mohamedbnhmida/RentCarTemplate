import 'package:rent_car_dashboard/ui/screens/register_scene/controller/register_controller.dart';
import 'package:rent_car_dashboard/ui/screens/register_scene/widgets/social_login_button.dart';
import 'package:rent_car_dashboard/ui/theme_controller.dart';
import 'package:rent_car_dashboard/ui/widgets/app_logo.dart';
import 'package:rent_car_dashboard/ui/widgets/loading_progress.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/theme_icon_tile.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart'; 
 
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; 
class RegisterPage extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
 final ThemeController themecontroller = Get.put(ThemeController()); // Initialize the theme controller

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SafeArea(
        child: Stack(
          children: [
            Center(
                child: SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                      width: 296,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           AppLogo(),
                          AppPadding.paddingH24,
                          Text(
                            'Register',
                            style:  Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).primaryTextTheme.headlineMedium!.color),
                               
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Sign up with Open account',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 24),
                          SocialLoginButton(
                            onGoogleLoginPressed: () {},
                            onMicrosoftLoginPressed: () {},
                          ),
                          SizedBox(height: 24),
                          Divider(),
                          SizedBox(height: 24),
                          Text(
                            'Or continue with email address',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 16),
            
                          // Email TextField
                          Obx(() => TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: SvgPicture.asset(
                                'assets/icons/mail_light.svg',
                                height: 16,
                                width: 20,
                                fit: BoxFit.none,
                              ),
                              suffixIcon: SvgPicture.asset(
                                controller.isEmailValid.value
                                    ? 'assets/icons/check_filled.svg'
                                    : 'assets/icons/close_filled.svg',
                                width: 17,
                                height: 11,
                                fit: BoxFit.none,
                                colorFilter: ColorFilter.mode(
                                  controller.isEmailValid.value
                                      ? Colors.green
                                      : Colors.red,
                                  BlendMode.srcIn,
                                ),
                              ),
                              hintText: 'Your email',
                            ),
                            onChanged: controller.validateEmail,
                          )),
                          SizedBox(height: 16),
            
                          // Name TextField
                          TextFormField(
                            controller: controller.nameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Your Name',
                            ),
                          ),
                          SizedBox(height: 16),
            
                          // Password TextField
                           Obx(() {
                          return
                          TextFormField(
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            
                           obscureText: controller.obscurePassword.value,
                            decoration: InputDecoration(
                              prefixIcon: SvgPicture.asset(
                                'assets/icons/lock_light.svg',
                                height: 16,
                                width: 20,
                                fit: BoxFit.none,
                              ),
                                     suffixIcon: IconButton(
                                        icon: Icon(
                                          controller.obscurePassword.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          controller.obscurePassword.value =
                                              !controller.obscurePassword.value;
                                        },
                                      ),
                              hintText: 'Password',
                            ),
                          );
                           
                        }),
                          SizedBox(height: 16),
            
                          // Confirm Password TextField
                            Obx(() {
                          return 
                          TextFormField(
                            controller: controller.confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                           obscureText: controller.obscureConfirmPassword.value,
                            decoration: InputDecoration(
                              prefixIcon: SvgPicture.asset(
                                'assets/icons/lock_light.svg',
                                height: 16,
                                width: 20,
                                fit: BoxFit.none,
                              )
                              ,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          controller.obscureConfirmPassword.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          controller.obscureConfirmPassword.value =
                                              !controller.obscureConfirmPassword.value;
                                        },
                                      ),
                              hintText: 'Confirm Password',
                            ),
                          );
                           
                        }),
                          SizedBox(height: 16),
            
                          // Register Button
                       
                  Obx(() {
                          if (controller.isLoading.value) {
                            return   LoadingProgress();
                          } else {
                          return SizedBox(
                            width: 296,
                            child: ElevatedButton(
                              onPressed: controller.register,
                              child: const Text('Register'),
                            ),
                          );
                          }
                        }),
            
            
            
                          SizedBox(height: 24),
            
                          // Footer Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Already a member?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.grey),
                              ),
                             TextButton(
              onPressed: () => Get.toNamed(AppRoutes.login),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.2)),
              ),
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.blue),
              ),
            ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
           
               Positioned(
              top: 20,
              right: 20,
              child:   ThemeIconTile(
                  isDark: themecontroller.isDarkTheme.value,
                  onPressed: () {
                    themecontroller.toggleTheme(!themecontroller.isDarkTheme.value);
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}