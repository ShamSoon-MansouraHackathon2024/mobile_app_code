import 'package:flutter/cupertino.dart';
import 'package:shamsoon/generated/assets.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Image.asset(Assets.imagesAppLogo));
  }
}
