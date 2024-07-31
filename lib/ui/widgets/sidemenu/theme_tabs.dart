import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/controller/message_controller.dart';
import 'package:rent_car_dashboard/ui/theme_controller.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/ui/widgets/tabs/tab_with_icon.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeTabs extends StatefulWidget {
  const ThemeTabs({super.key});

  @override
  State<ThemeTabs> createState() => _ThemeTabsState();
}

class _ThemeTabsState extends State<ThemeTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; 
 final ThemeController controller = Get.put(ThemeController()); // Initialize the theme controller

  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() { 
          _selectedIndex = _tabController.index;   
          controller.toggleTheme(_selectedIndex == 1); 
        });
      });
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius * 5),
      ),
      child: TabBar(enableFeedback: true,
        controller: _tabController,
        dividerHeight: 0,
        splashBorderRadius: BorderRadius.circular(AppConstants.borderRadius * 5),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.padding * 0.5,
          vertical: AppConstants.padding * 0.5,
        ),
        indicator: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppConstants.borderRadius * 5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        indicatorSize: TabBarIndicatorSize.tab,labelColor: Theme.of(context).iconTheme.color,unselectedLabelColor:Theme.of(context).textTheme.bodyLarge!.color ,
        tabs: [
          TabWithIcon(
            isSelected: _selectedIndex == 0,
            title: 'Light',
            iconSrc: 'assets/icons/sun_filled.svg', activeColor:  Theme.of(context).iconTheme.color!, inactiveColor: Theme.of(context).iconTheme.color!,
          ),
          TabWithIcon(
            isSelected: _selectedIndex == 1,
            title: 'Dark',
            iconSrc: 'assets/icons/moon_light.svg', activeColor: Theme.of(context).iconTheme.color!, inactiveColor: Theme.of(context).iconTheme.color!,
          ),
        ],
      ),
    );
  }
}

class TabWithIcon extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String iconSrc;
  final Color activeColor;
  final Color inactiveColor;

  const TabWithIcon({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.iconSrc,
    required this.activeColor,
    required this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row  (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconSrc,
            color: isSelected ? activeColor : inactiveColor,
          ),
          SizedBox(width: 4.0), // Adjust spacing as needed
          Text(
            title,
            style: TextStyle(fontSize: 12,
              color: isSelected ? activeColor : inactiveColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}