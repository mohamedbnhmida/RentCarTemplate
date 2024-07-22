import 'package:rent_car_dashboard/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    this.onGoogleLoginPressed,
    this.onMicrosoftLoginPressed,
  });

  final Function()? onGoogleLoginPressed, onMicrosoftLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          onPressed: onGoogleLoginPressed,
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/google_filled.svg'),
              AppPadding.paddingW8,
              const Text('Google')
            ],
          ),
        ),
        AppPadding.paddingW8,
        OutlinedButton(
          onPressed: onMicrosoftLoginPressed,
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/Microsoft_logo.svg'),
              AppPadding.paddingW8,
              const Text('Microsoft')
            ],
          ),
        ),
      ],
    );
  }
}
