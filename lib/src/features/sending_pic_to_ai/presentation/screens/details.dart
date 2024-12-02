import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:shamsoon/src/core/constants/app_constants.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/padding.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/bloc/panel_details_cubit.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/bloc/panel_details_state.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/widget/battery_level.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/widget/send_image.dart';

import '../widget/weather.dart';


class PanelDetails extends StatelessWidget {
  const PanelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: 'Panel Details'),
      ),
      body: Padding(
        padding: context.horizontalSymmetricPadding(12.w),
        child: Column(
          children: [
            const BatteryLevel(),
            SizedBox(height: 10.h),
            const SendImageWidget(),
            SizedBox(height: 10.h),
            const Weather()
          ],
        ),
      ),
    );
  }
}
