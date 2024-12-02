import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/src/core/constants/app_constants.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/mediaQuery.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Constants.appColor)
      ),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.setHeight(20)
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(text: 'London'),
                  SizedBox(width: 5),
                  Icon(Icons.wb_sunny_outlined),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      AppText(text: '12°C', fontWeight: FontWeight.bold, color: Constants.appColor,),
                      const AppText(text: 'Feels like 10°C'),
                    ],
                  ),
                  const SizedBox(width: 30,),
                  const Column(
                    children: [
                      AppText(text: 'min temp : 12°C'),
                      AppText(text: 'max temp : 20°C'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
