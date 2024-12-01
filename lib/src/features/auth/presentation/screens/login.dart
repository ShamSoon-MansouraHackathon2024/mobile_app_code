import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/generated/assets.dart';
import 'package:shamsoon/src/core/constants/app_constants.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/padding.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/routes.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text_field.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/toast.dart';
import 'package:shamsoon/src/features/auth/data/data_source/models/login.dart';
import 'package:shamsoon/src/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:shamsoon/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:shamsoon/src/features/auth/presentation/widgets/half_auth_screens.dart';
import 'package:shamsoon/src/features/home/presentation/screens/main_screen.dart';
import 'package:svg_flutter/svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late final TextEditingController emailController;
  late final TextEditingController passController;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.horizontalSymmetricPadding(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesAppLogo),
            Padding(
              padding: context.verticalSymmetricPadding(10.w),
              child: AppText(text: 'Welcome back', fontWeight: FontWeight.w600, fontSize: 22.sp,),
            ),
            AppTextFormField(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide(
                      color: Constants.appColor
                  )
              ),
              controller: emailController,
              hintText: 'Enter your Email',
              hintStyle: const TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 16.h,
            ),
            AppTextFormField(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                borderSide: BorderSide(
                  color: Constants.appColor
                )
              ),
              controller: passController,
              hintText: 'Enter your password',
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility_off)),
            ),

            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                AppText(text: 'Remember me', color: Constants.appColor,),
                const Spacer(),
                TextButton(onPressed: () {}, child: const AppText(text: 'Forgot Password?', color: Colors.black,)),
              ],
            ),
            Expanded(
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state.currentState == AuthStates.loginSuccess){
                    AppToast.showToast(context, msg: state.errorMsg!);
                  }else if(state.currentState == AuthStates.loginError){
                    context.removeOldRoute(const Home());
                  }
                } ,
                builder: (context, state) => HalfAuthScreens(
                        btnText: 'Log in',
                        onClick: state.currentState == AuthStates.loginLoading?
                        null : () {
                          context.read<AuthCubit>().login(
                              LoginModel(
                                  email: emailController.text,
                                  password: passController.text
                              )
                          );
                        },
                        question: 'Don\'t have an account?',
                        secondOptionText: 'Sign up'
                    ),
              )
            )
          ],
        ),
      ),
    );
  }
}
