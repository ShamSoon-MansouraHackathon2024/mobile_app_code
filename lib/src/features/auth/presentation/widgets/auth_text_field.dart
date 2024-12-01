import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/padding.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text_field.dart';

import '../../../../core/constants/app_constants.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  const AuthTextField({Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalSymmetricPadding(8.h),
      child: AppTextFormField(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: BorderSide(
                color: Constants.appColor
            )
        ),
        controller: controller,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
