import 'package:get/get.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/controllers/vehicule_controller.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/vehicule_scene/widgets/vehicules.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/widgets/overview.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/widgets/product_overview.dart'; 
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../widgets/loading_progress.dart';
import 'screens/vehicule_scene/screens/vehicule_page.dart';
import 'screens/vehicule_scene/widgets/list_car_widget.dart';
import '../../../utils/app_padding.dart';
import 'widgets/comments.dart';
import 'widgets/get_more_customers.dart';
import 'widgets/popular_products.dart';
import 'widgets/pro_tips.dart';
import 'widgets/refund_request.dart';

  class DashboardPage extends StatelessWidget {
    const DashboardPage({super.key});

    @override
    Widget build(BuildContext context) {
           final VehiculeController controller = Get.put(VehiculeController());

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Responsive.isMobile(context)) AppPadding.paddingH24,
          Text(
            "Dashboard",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          AppPadding.paddingH20,
              Obx(
          () => controller.isLoading.value
              ? Center(
                  child: LoadingProgress(),
                )
              :  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const Overview(),
                    AppPadding.paddingH16,
                    const ProductOverviews(),
                    AppPadding.paddingH16,
                    const Vehicules(),
                    AppPadding.paddingH16,
                    const ProTips(), 
                    AppPadding.paddingH16,
                    const GetMoreCustomers(),
                    if (Responsive.isMobile(context))
                      const Column(
                        children: [
                          AppPadding.paddingH16,
                          PopularProducts(),
                          AppPadding.paddingH16,
                          Comments(),
                          AppPadding.paddingH16,
                          RefundRequest(newRefund: 8, totalRefund: 52),
                          AppPadding.paddingH8,
                        ],
                      ),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context)) AppPadding.paddingW16,
              if (!Responsive.isMobile(context))
                  Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      PopularProducts(),
                      AppPadding.paddingH16,
                      Comments(),
                      AppPadding.paddingH16,
                      RefundRequest(newRefund: 8, totalRefund: 52),
                      AppPadding.paddingH8,
                    ],
                  ),
                ),
            ],
          ),
        ),
         
        ],
      );
    }
  }

