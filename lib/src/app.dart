import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shamsoon/src/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:shamsoon/src/features/bottom_bar/presentation/widgets.dart';
import 'core/data_source/local/shared.dart';
import 'core/helpers/data_types/permession_process_model.dart';
import 'core/helpers/helper_methods/handle_permissions.dart';
import 'core/shared/observers/route_observer.dart';
import 'features/auth/presentation/screens/login.dart';
import 'features/home/presentation/screens/main_screen.dart';
import 'features/sending_pic_to_ai/presentation/bloc/panel_details_cubit.dart';
import 'features/sending_pic_to_ai/presentation/screens/details.dart';
import 'features/splash/splash.dart';
class ShamSoon extends StatefulWidget {
  const ShamSoon({super.key});

  @override
  State<ShamSoon> createState() => _ShamSoonState();
}

class _ShamSoonState extends State<ShamSoon> {

  @override
  void initState() {
    AppPermission().check(
      PermissionProcessModel(
        permissionClient: PermissionClient.notification,
        onPermissionGranted: () {},
        onPermissionDenied: () {},
      ),
    );
    super.initState();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
      return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GetIt.instance.get<AuthCubit>(),),
          BlocProvider(create: (context) => GetIt.instance.get<PanelDetailsCubit>(),)
        ],
        child: MaterialApp(
          // shortcuts: ,
          // actions: ,
          locale: context.locale, // context.setLocal
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          title: 'App Name'.tr(), // give the translation of App Name for example
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          navigatorObservers: [AppNavigationObserver()],
          // theme: CacheHelper.getInstance().shared.getBool('appTheme') == false
          //     ? ThemeData.light()
          //     : ThemeData.dark(),
          home: const Splash(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}