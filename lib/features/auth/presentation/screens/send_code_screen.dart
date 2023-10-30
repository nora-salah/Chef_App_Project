import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/utils/app_assets.dart';
import 'package:chef_app_project/core/utils/app_strings.dart';
import 'package:chef_app_project/core/widgets/custom_images.dart';
import 'package:chef_app_project/core/widgets/custom_text_form_field.dart';
import 'package:chef_app_project/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app_project/features/auth/presentation/cubit/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateReplacement(context: context, route: Routes.sendCode);
        }, icon: const Icon(Icons.arrow_back)),

        title: Text(AppStrings.forgetPassword.tr(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.h),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if(state is SendCodeSucessState){
                showTwist(state:ToastStates.success,message: state.massage );
                navigateReplacement(context: context, route: Routes.resetPassword);
              }
              /*if(state is SendCodeErrorState){
                showTwist(state:ToastStates.error,message:  AppStrings.loginFailed.tr(context) );
              }*/
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                      child: CustomImages(imgPath: AppAssets.lock),
                    ),
                    Text(AppStrings.sendResetLinkInfo.tr(context)),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context).emailController,
                      hint: AppStrings.email.tr(context),
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    state is SendCodeLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                          onPressed: () {
                            if (BlocProvider.of<ForgetPasswordCubit>(
                                    context)
                                .sendCodeKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<ForgetPasswordCubit>(context)
                                  .sendCode();
                            }
                          },
                          text: AppStrings.sendResetLink.tr(context),
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
