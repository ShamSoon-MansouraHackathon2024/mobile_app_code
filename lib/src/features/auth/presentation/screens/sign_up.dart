import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/src/core/helpers/base_extensions/context/padding.dart';
import 'package:shamsoon/src/core/helpers/base_widgets/text.dart';
import 'package:shamsoon/src/core/helpers/helper_methods/validators.dart';
import 'package:shamsoon/src/features/auth/data/data_source/models/resgistes_model.dart';
import 'package:shamsoon/src/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:shamsoon/src/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:shamsoon/src/features/auth/presentation/widgets/half_auth_screens.dart';
import '../../../../core/helpers/app_widgets/app_logo.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController nameController;

  late final TextEditingController emailController;

  late final TextEditingController passController;

  late final TextEditingController confirmPassController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.horizontalSymmetricPadding(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogoWidget(),
              AppText(text: 'Welcome', fontSize: 22.sp, fontWeight: FontWeight.w600),
              AuthTextField(controller: nameController, hintText: 'user name', validator: Validators.validateEmpty),
              AuthTextField(controller: emailController, hintText: 'email', validator: Validators.validateEmail),
              AuthTextField(
                controller: passController,
                hintText: 'password',
                validator: Validators.validatePassword,
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility_off)),
              ),
              AuthTextField(
                controller: confirmPassController,
                hintText: 'confirm password',
                validator: (p0) => Validators.validatePasswordConfirm(p0, passController.text),
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility_off)),
              ),
              HalfAuthScreens(
                btnText: 'Sign up',
                question: 'Already have an account?',
                secondOptionText: 'Log in',
                onClick: () {
                  final model = RegisterModel(
                      name: nameController.text,
                      email: emailController.text,
                      password: passController.text,
                      confirmPassword: confirmPassController.text
                  );
                  context.read<AuthCubit>().signUp(model);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}