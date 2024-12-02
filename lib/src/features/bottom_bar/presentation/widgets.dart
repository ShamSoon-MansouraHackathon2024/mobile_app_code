import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shamsoon/src/features/bottom_bar/presentation/model.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/screens/details.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/screens/details.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/screens/details.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/screens/details.dart';

import '../../../core/constants/app_constants.dart';
import '../../home/presentation/screens/main_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List<Widget> screens =
  const [
    PanelDetails(),
    PanelDetails(),
    PanelDetails(),
    PanelDetails(),
  ];

  final List<BottomNavigationBarItemElement> elements =
  [
    BottomNavigationBarItemElement(
        icon: const Icon(Icons.home), label: ''
    ),
    BottomNavigationBarItemElement(
        icon: const Icon(Icons.analytics_outlined), label: ''
    ),
    BottomNavigationBarItemElement(
        icon: Icon(Icons.person,size: 28.sp,),
        label: ''
    ),
    BottomNavigationBarItemElement(
        icon: Icon(Icons.settings,size: 28.sp,),
        label: ''),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75.h,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
            borderRadius:  BorderRadius.vertical(
                top: Radius.circular(14)
            ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: List.generate(
            elements.length,
                (index) => BottomNavigationBarItem(
              icon: elements[index].icon,
              label: elements[index].label,
            ),
          ),
          backgroundColor: Constants.appColor,
          selectedIconTheme: IconThemeData(
              color: HexColor('#45A415'),
              size: 30.sp
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          onTap: (newScreen) {
            setState(() {
              currentIndex = newScreen;
            });
          },
          currentIndex: currentIndex,
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
