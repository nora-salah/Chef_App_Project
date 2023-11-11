import 'package:chef_app_project/core/database/api/end_points.dart';
import 'package:chef_app_project/core/database/cache/cache_helper.dart';
import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/utils/app_colors.dart';
import 'package:chef_app_project/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_images.dart';
import '../../../profile/presentation/screens/setting_screen.dart';
import '../../../profile/presentation/screens/setting_screen.dart';

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
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await sl<CacheHelper>().getData(
                key: Apikeys.token,
              ) ==
              null
          ? navigate(context: context, route: Routes.setting)
          : navigate(context: context, route: Routes.home);
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
