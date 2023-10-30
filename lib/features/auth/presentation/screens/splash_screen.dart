import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/utils/app_colors.dart';
import 'package:chef_app_project/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      navigate(context: context, route: Routes.changeLang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImages(
              imgPath: AppAssets.appLogo,
              height: 120.h,
              width: 120.w,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              AppStrings.chefApp.tr(context),
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}
