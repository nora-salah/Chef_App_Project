import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_images.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/forget_password_cubit/forget_password_cubit.dart';
import '../cubit/forget_password_cubit/forget_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateReplacement(context: context, route: Routes.resetPassword);
        }, icon: const Icon(Icons.arrow_back)),

        title: Text(AppStrings.createYourNewPassword.tr(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.h),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if(state is ResetPasswordSuccessState){
                showTwist(state:ToastStates.success,message: state.message );
                navigateReplacement(context: context, route: Routes.login);
              }
              /*if(state is SendCodeErrorState){
                showTwist(state:ToastStates.error,message:  AppStrings.loginFailed.tr(context) );
              }*/
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).resetPasswordKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                      child: const CustomImages(imgPath: AppAssets.lock),
                    ),
                    Text(AppStrings.createYourNewPassword.tr(context)),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .newPasswordController,
                      hint: AppStrings.newPassword.tr(context),
                      passwordIsVisable:
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .isNewPasswordShowing,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .suffixIconPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeNewPasswordSuffixIcon();
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
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordController,
                      hint: AppStrings.confirmPassword.tr(context),
                      passwordIsVisable:
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .isConfirmPasswordShowing,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .suffixIconConfirmPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeConfirmPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        if (data!= BlocProvider.of<ForgetPasswordCubit>(context)
                            .newPasswordController.text) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .codeController,
                      hint: AppStrings.code.tr(context),
                      validate: (data) {
                        if (num.tryParse(data!) == null) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }

                        if (data.isEmpty) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    state is ResetPasswordLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                      onPressed: () {
                        if (BlocProvider.of<ForgetPasswordCubit>(
                            context)
                            .resetPasswordKey
                            .currentState!
                            .validate()) {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                           .resetPassword();
                        }
                      },
                      text: AppStrings.createYourNewPassword.tr(context),
                    ),
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
