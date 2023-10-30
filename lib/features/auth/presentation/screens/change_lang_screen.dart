import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/utils/app_assets.dart';
import 'package:chef_app_project/core/widgets/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/cubit/global_cubit.dart';
import '../../../../core/bloc/cubit/global_state.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_button.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const CustomImages(
              imgPath: AppAssets.background,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    height: 116.h,
                  ),
                  //image logo
                  CustomImages(
                    imgPath: AppAssets.appLogo,
                    height: 120.h,
                    width: 120.w,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //text logo
                  Text(
                    AppStrings.welcomeToChefApp.tr(context),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  Text(
                    AppStrings.pleaseChooseYourLanguage.tr(context),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  BlocBuilder<GlobalCubit, GlobalState>(
                      builder: (context, state) {
                    return Row(
                      children: [
                        CustomButton(
                            text: 'English',
                            onPressed: () {
                              BlocProvider.of<GlobalCubit>(context).changeLang('en');

                              navigate(context: context, route: Routes.login);
                            },
                            width: 140,
                            background: AppColors.black),
                        const Spacer(),
                        CustomButton(
                            text: 'العربية',
                            onPressed: () {
                              BlocProvider.of<GlobalCubit>(context).changeLang('ar');
                              navigate(context: context, route: Routes.login);
                            },
                            width: 140,
                            background: AppColors.black),
                      ],
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
