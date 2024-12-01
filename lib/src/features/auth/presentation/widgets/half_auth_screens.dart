import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/padding.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/routes.dart';
import 'package:shamsoon/src/features/auth/presentation/screens/login.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/app_widgets/app_button.dart';
import '../../../../core/helpers/base_widgets/divider.dart';
import '../../../../core/helpers/base_widgets/text.dart';
import '../screens/sign_up.dart';

class HalfAuthScreens extends StatelessWidget {
  final String btnText;
  final String question;
  final String secondOptionText;

  final void Function()? onClick;
  const HalfAuthScreens({Key? key,
    required this.btnText,
    required this.question,
    required this.secondOptionText,
    required this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButton(buttonText: btnText, onClick: onClick),
        Row(
          children: [
            const Expanded(child: AppDivider()),
            Padding(
              padding: context.horizontalSymmetricPadding(8.w),
              child: const AppText(text: "OR"),
            ),
            const Expanded(child: AppDivider()),
          ],
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                    side: BorderSide(color: Constants.appColor)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesGoogle),
                  SizedBox(
                    width: 7.w,
                  ),
                  const AppText(text: 'Sign in With Google', color: Colors.grey,)
                ],
              ),
            )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text: question),
            TextButton(
              onPressed: () {
                switch(secondOptionText){
                  case 'Log in':
                    context.removeOldRoute(const Login());

                  default:
                    context.normalNewRoute(const SignUp());
                }
              },
              child: AppText(text: secondOptionText, color: Constants.appColor),
            )
          ],
        ),
      ],
    );
  }
}
