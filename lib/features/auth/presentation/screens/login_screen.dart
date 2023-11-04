import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/routes/app_routes.dart';
import 'package:chef_app_project/core/widgets/custom_button.dart';
import 'package:chef_app_project/core/widgets/custom_loading_indecator.dart';
import 'package:chef_app_project/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:chef_app_project/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_images.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSucessState) {
                showTwist(
                    message: AppStrings.loginSucessfully.tr(context),
                    state: ToastStates.success);

                navigateReplacement(context: context, route: Routes.home);
              }
              if (state is LoginErrorState) {
                showTwist(message: state.massage, state: ToastStates.error);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<LoginCubit>(context).loginKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        const CustomImages(
                          imgPath: AppAssets.backgroundTwo,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 92.h,
                        ),
                        Center(
                          child: Text(
                            AppStrings.welcomeBack.tr(context),
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailController,
                            hint: AppStrings.email.tr(context),
                            validate: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return AppStrings.pleaseEnterValidEmail
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            hint: AppStrings.password.tr(context),
                            passwordIsVisable:
                                BlocProvider.of<LoginCubit>(context)
                                    .isLoginPasswordsShowing,
                            icon:
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                            suffixIconOnPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .changeLoginPasswordSuffixIcon();
                            },
                            validate: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return AppStrings.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigateReplacement(context: context, route: Routes.sendCode);
                                },
                                child:
                                    Text(AppStrings.forgetPassword.tr(context)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          state is LoginLoadingState
                              ? const CustomLoadingIndicator()
                              : CustomButton(
                                  onPressed: () {
                                    if (BlocProvider.of<LoginCubit>(context)
                                        .loginKey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<LoginCubit>(context)
                                          .login();
                                    }
                                  },
                                  text: AppStrings.signIn.tr(context)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
