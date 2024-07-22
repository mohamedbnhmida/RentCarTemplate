import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';
class CustomerRoundedAvatar extends StatelessWidget {
  const CustomerRoundedAvatar({
    super.key,
    this.height = 54,
    this.width = 54,
    this.radius = AppConstants.borderRadius,
    required this.imageSrc,
  });

  final double height, width, radius;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageSrc),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
