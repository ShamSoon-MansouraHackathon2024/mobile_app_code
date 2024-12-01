import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/src/core/constants/app_constants.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/bloc/panel_details_cubit.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/bloc/panel_details_state.dart';

class PanelDetails extends StatelessWidget {
  const PanelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding  (
              padding: const EdgeInsets.all(8.0),
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
                              onPressed: () {},
                              child: const AppText(text: 'Send')
                          ) : const SizedBox.shrink()
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
