import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconTile extends StatefulWidget {
  const IconTile({
    super.key,
    this.activeIconSrc,
    this.inactiveIconSrc,
    required this.onPressed,
    this.isActive = false,
    this.isSubmenu = false,
  });

  final String? inactiveIconSrc, activeIconSrc;
  final VoidCallback onPressed;
  final bool isActive, isSubmenu;

  @override
  State<IconTile> createState() => _IconTileState();
}

class _IconTileState extends State<IconTile> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(AppConstants.padding * 0.25),
        decoration: BoxDecoration(
            color: widget.isActive
                ? AppColors.highlightDark
                : _isHover
                    ? AppColors.highlightLight.withOpacity(0.5)
                    : null,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            boxShadow: widget.isActive
                ? [
                    BoxShadow(
                      color: AppColors.highlightLight.withOpacity(0.5),
                      blurRadius:2,
                      spreadRadius: 1,
                    )
                  ]
                : null),
        child: widget.activeIconSrc != null
            ? Center(
                child: SvgPicture.asset(
                  (widget.isActive || widget.inactiveIconSrc == null)
                      ? widget.activeIconSrc!
                      : widget.inactiveIconSrc!,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      widget.isActive
                          ?Colors.white
                          : Theme.of(context).iconTheme.color!,
                      BlendMode.srcIn),
                ),
              )
            : null,
      ),
    );
  }
}
