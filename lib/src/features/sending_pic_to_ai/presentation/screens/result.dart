import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/bloc/panel_details_cubit.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/bloc/panel_details_state.dart';

class AiResult extends StatefulWidget {
  const AiResult({super.key});

  @override
  State<AiResult> createState() => _AiResultState();
}

class _AiResultState extends State<AiResult> {

  bool isLoading = false;
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PanelDetailsCubit ,PanelDetailsState>(
        builder: (context, state) {
          if(isLoading){
            return Center(child: const CircularProgressIndicator());
          }else{
            return Center(child: AppText(text: 'The result is : Electrical-damage', fontWeight: FontWeight.bold, fontSize: 25,));
          }
        },
      ),
    );
  }
}
