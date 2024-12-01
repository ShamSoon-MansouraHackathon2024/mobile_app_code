import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/helpers/app_widgets/error_builder/screen.dart';
import '../../../../core/helpers/base_widgets/image_handler.dart';
import '../../../../core/helpers/base_widgets/text.dart';
import '../../blocs/home/cubit.dart';
import '../../blocs/home/state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (context) => GetIt.instance.get<HomeCubit>()..getHomeData(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state.currentState) {
                case States.homeDataLoading:
                  return const Center(child: CircularProgressIndicator());
                case States.homeDataError:
                  return ErrorBuilder(
                      msg: state.errorMsg!, onPressed: () =>
                      context.read<HomeCubit>().getHomeData()
                  );
                default:
                  return ListView.builder(
                    itemCount: state.homeData!.length,
                    itemBuilder: (context, index) =>
                        ListTile(
                          leading: NetworkImageHandler(
                              url: state.homeData![index].photo),
                          title: AppText(text: state.homeData![index].name),
                          subtitle: AppText(
                              text: state.homeData![index].description),
                        ),
                  );
              }
            },
          ),
        )
    );
  }
}