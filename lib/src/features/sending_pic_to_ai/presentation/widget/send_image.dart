import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/mediaQuery.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/routes.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/bloc/panel_details_cubit.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/screens/result.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/base_widgets/text.dart';
import '../bloc/panel_details_state.dart';

class SendImageWidget extends StatelessWidget {
  const SendImageWidget({super.key});

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
          child: Padding  (
            padding: EdgeInsets.symmetric(
                vertical: context.setHeight(20)
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    AppText(text: 'Check your panel condition', fontSize: 16.sp,),
                    AppText(text: 'Open Camera/Upload photo', fontSize: 15.sp, color: Constants.appColor,),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 35.sp,
                      backgroundColor: Constants.appColor,
                      child: IconButton(
                          onPressed: () {
                            context.read<PanelDetailsCubit>().pickImage();
                          },
                          icon: const Icon(Icons.upload, color: Colors.white,)
                      ),
                    ),
                    BlocBuilder<PanelDetailsCubit, PanelDetailsState>(
                        builder: (context, state) => state.selectedImage != null? TextButton(
                            onPressed: () {
                              context.normalNewRoute(AiResult());
                              // context.read<PanelDetailsCubit>().sendImageToAi();
                            },
                            child: const AppText(text: 'Send')
                        ) : const SizedBox.shrink()
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
