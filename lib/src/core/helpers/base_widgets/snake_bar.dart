import 'package:flutter/material.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';

class MySnackBar
{
  static void showSnackBar({
    required context,
    required String message,
    Color? color
  })
  {
    SnackBar snackBar = SnackBar(
      backgroundColor: color?? Colors.grey,
      content: AppText(
        text: message,
        fontSize: 20,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}