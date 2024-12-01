import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/src/core/constants/app_constants.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/mediaQuery.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onClick;

  const AppButton({super.key,
    required this.buttonText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.appColor,
        ),
        child: SizedBox(
          height: 50.h,
            width: context.setWidth(1),
            child: Center(
                child: AppText(text: buttonText, fontSize: 16.sp, color: Colors.white,)
            )
        )
    );
  }
}
