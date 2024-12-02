import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/mediaQuery.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';

import '../../../../core/constants/app_constants.dart';

class BatteryLevel extends StatelessWidget {
  const BatteryLevel({super.key});

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
            horizontal: context.setWidth(4.8),
            vertical: context.setHeight(20)
          ),
          child: AnimatedRadialGauge(
            builder: (context, child, value) {
              return const AppText(text: 'Battery Level : 80%');
            },
              initialValue: 0,
              /// The animation duration.
              duration: const Duration(seconds: 3),
              curve: Curves.bounceIn,

              /// Define the radius.
              /// If you omit this value, the parent size will be used, if possible.
              radius: 100,

              /// Gauge value.
              value: 80,

              /// Optionally, you can configure your gauge, providing additional
              /// styles and transformers.
              axis: GaugeAxis(
                /// Provide the [min] and [max] value for the [value] argument.
                  min: 0,
                  max: 100,
                  /// Render the gauge as a 180-degree arc.
                  degrees: 180,

                  /// Set the background color and axis thickness.
                  style: const GaugeAxisStyle(
                    thickness: 20,
                    background: Color(0xFFDFE2EC),
                    segmentSpacing: 4,
                  ),

                  /// Define the pointer that will indicate the progress (optional).
                  pointer: GaugePointer.needle(
                    color: const Color(0xFF193663),
                    width: 16.w,
                    height: 100.h,
                    borderRadius: 16,
                  ),

                  /// Define the progress bar (optional).
                  progressBar: const GaugeProgressBar.rounded(
                    color: Color(0xFFB4C2F8),
                  ),

                  /// Define axis segments (optional).
                  segments: const [
                    GaugeSegment(
                      from: 0,
                      to: 33.3,
                      color: Color(0xFFD9DEEB),
                      cornerRadius: Radius.zero,
                    ),
                    GaugeSegment(
                      from: 33.3,
                      to: 66.6,
                      color: Color(0xFFD9DEEB),
                      cornerRadius: Radius.zero,
                    ),
                    GaugeSegment(
                      from: 66.6,
                      to: 100,
                      color: Color(0xFFD9DEEB),
                      cornerRadius: Radius.zero,
                    ),
                  ]

                /// You can also, define the child builder.
                /// You will build a value label in the following way, but you can use the widget of your choice.
                ///
                /// For non-value related widgets, take a look at the [child] parameter.
                /// ```
                /// builder: (context, child, value) => RadialGaugeLabel(
                ///  value: value,
                ///  style: const TextStyle(
                ///    color: Colors.black,
                ///    fontSize: 46,
                ///    fontWeight: FontWeight.bold,
                ///  ),
                /// ),
                /// ```
              ),
            ),
        ),
      ),
    );
  }
}
