import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:rent_car_dashboard/ui/widgets/avatar/customer_rounded_avatar.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PopularProductItem extends StatefulWidget {
  const PopularProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.imageSrc,
    this.isActive = true,
    this.onPressed,
  });

  final String name, price, imageSrc;
  final bool isActive;
  final Function()? onPressed;

  @override
  State<PopularProductItem> createState() => _PopularProductItemState();
}

class _PopularProductItemState extends State<PopularProductItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.padding * 0.5,
        vertical: AppConstants.padding * 0.75,
      ),
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: Row(
          children: [
            CustomerRoundedAvatar(imageSrc: widget.imageSrc),
            AppPadding.paddingW8,
            Expanded(
              child: Text(
                widget.name,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isHovered ? AppColors.primary : null),
              ),
            ),
            AppPadding.paddingW8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.price,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: isHovered ? AppColors.primary : null),
                ),
                AppPadding.paddingH4,
                Chip(
                  backgroundColor: widget.isActive
                      ? AppColors.success.withOpacity(0.1)
                      : AppColors.error.withOpacity(0.1),
                  side: BorderSide.none,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.padding * 0.25,
                      vertical: AppConstants.padding * 0.25),
                  label: Text(
                    widget.isActive ? "Active" : "Deactive",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: widget.isActive
                            ? AppColors.success
                            : AppColors.error),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
