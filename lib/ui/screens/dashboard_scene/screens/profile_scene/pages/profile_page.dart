import 'package:rent_car_dashboard/ui/widgets/loading_progress.dart';
import 'package:rent_car_dashboard/ui/widgets/section_title.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/utils/responsive.dart'; 

import '../controller/profile_controller.dart'; 
 
 
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
      final ProfileController controller = Get.put(ProfileController());

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.max,
        children: [
         
           if (!Responsive.isMobile(context)) AppPadding.paddingH24,
          Text(
            "Profile",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
           AppPadding.paddingH24,
         Obx(
          () => controller.isLoading.value
              ? Center(
                  child: LoadingProgress(),
                )
              : Container(
      padding: const EdgeInsets.all(AppConstants.padding),
      decoration:   BoxDecoration(
       color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding.paddingH8,
           const SectionTitle(
                title: "Profile",
                color: AppColors.secondaryMistyrose,
              ),
           
          AppPadding.paddingH20,
          Text(
            'Profile Infos',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          AppPadding.paddingH20,
         ProfileContent()
        ],
      ),
    ),
        ),
        ],
       
    );
  }
}
class ProfileContent extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Center(

      
      child: Container(
        
        constraints: BoxConstraints(maxWidth: 500),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Obx(() {
                    if (controller.webImage.value != null) {
                      return CircleAvatar(
                        radius: 70,
                        backgroundImage: MemoryImage(controller.webImage.value!),
                      );
                    } else if (controller.imageFile.value != null) {
                      return CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(controller.imageFile.value!),
                      );
                    } else {
                      return CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/cars/range.png'),
                      );
                    }
                  }),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(150),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white),
                        iconSize: 24,
                        onPressed: controller.pickImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppPadding.paddingH24,
            AppPadding.paddingH24,
            Obx(() => TextFormField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
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
                    controller.isEmailValid.value ? Colors.green : Colors.red,
                    BlendMode.srcIn,
                  ),
                ),
                hintText: 'Your email',
              ),
              onChanged: controller.validateEmail,
              enabled: controller.isEditing.value,
            )),
            AppPadding.paddingH16,
            Obx(() => TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                prefixIcon: Icon(Icons.person),
                hintText: 'Your Name',
              ),
              enabled: controller.isEditing.value,
            )),
            AppPadding.paddingH16,
            Obx(() => TextFormField(
              controller: controller.passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/lock_light.svg',
                  height: 16,
                  width: 20,
                  fit: BoxFit.none,
                ),
                hintText: 'Password',
              ),
              enabled: controller.isEditing.value,
            )),
            AppPadding.paddingH16,
            Obx(() => TextFormField(
              controller: controller.confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/lock_light.svg',
                  height: 16,
                  width: 20,
                  fit: BoxFit.none,
                ),
                hintText: 'Confirm Password',
              ),
              enabled: controller.isEditing.value,
            )),
            AppPadding.paddingH24,
            AppPadding.paddingH24,
            Obx(() {
              if (controller.isEditing.value) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.save();
                        controller.toggleEditing();
                      },
                      child: Text('Save Changes'),
                    ),
                    AppPadding.paddingW24,
                    TextButton(
                      onPressed: controller.toggleEditing,
                      child: Text('Cancel'),
                    ),
                  ],
                );
              } else {
                return ElevatedButton(
                  onPressed: controller.toggleEditing,
                  child: Text('Edit'),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}