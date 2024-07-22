import 'package:flutter/material.dart';

import '../../../../utils/app_constants.dart';
import '../../../../utils/app_padding.dart';
import '../../../widgets/tabs/tab_with_growth.dart';
import '../../../../utils/app_colors.dart';
import 'customers_overview.dart';
import 'revenue_line_chart.dart';

class OverviewTabs extends StatefulWidget {
  const OverviewTabs({
    super.key,
  });

  @override
  State<OverviewTabs> createState() => _OverviewTabsState();
}

class _OverviewTabsState extends State<OverviewTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.bgLight,
            borderRadius:
                BorderRadius.all(Radius.circular(AppConstants.borderRadius)),
          ),
          child: TabBar(
            controller: _tabController,
            dividerHeight: 0,
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: AppConstants.padding),
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppConstants.borderRadius),
              ),
              color: AppColors.bgSecondayLight,
            ),
            tabs: const [
              TabWithGrowth(
                title: "Customers",
                amount: "1,200",
                growthPercentage: "20%",
              ),
              TabWithGrowth(
                title: "Revenue",
                iconSrc: "assets/icons/activity_light.svg",
                iconBgColor: AppColors.secondaryLavender,
                amount: "\$128K",
                growthPercentage: "2.7%",
                isPositiveGrowth: false,
              ),
            ],
          ),
        ),
        AppPadding.paddingH24,
        SizedBox(
          height: 280,
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Center(child: CoustomersOverview()),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.padding * 1.5,
                  vertical: AppConstants.padding,
                ),
                child: RevenueLineChart(),
              ),
            ],
          ),
        ), 
      ],
    );
  }
}
