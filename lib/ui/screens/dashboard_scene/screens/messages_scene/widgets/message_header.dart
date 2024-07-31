import 'package:rent_car_dashboard/ui/controllers/navigation_controller.dart';
import 'package:rent_car_dashboard/ui/screens/login_scene/controller/login_controller.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:rent_car_dashboard/ui/widgets/avatar/customer_rounded_avatar.dart';
import 'package:rent_car_dashboard/ui/widgets/sidemenu/customer_info.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';  
import 'package:cached_network_image/cached_network_image.dart';
class MessageHeader extends StatelessWidget { 

  final LoginController controller = Get.put(LoginController());
 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.padding, vertical: AppConstants.padding),
       color: Theme.of(context).cardColor,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if (Responsive.isMobile(context))
          
                IconButton(
          icon: Icon(Icons.arrow_back,   color: Theme.of(context).textTheme.bodyLarge!.color),
          onPressed: () => Get.back(),
        )  ,
                CircleAvatar(
      backgroundImage: NetworkImage(
        "https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression",
      ),
    ),AppPadding.paddingW16, Text("John Doe",style: Theme.of(context)
                    .textTheme
                    .bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
         
          ],
        ),
      ),
    );
  }
}
 