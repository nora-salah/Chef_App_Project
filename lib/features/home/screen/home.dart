import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app_project/features/home/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/commons.dart';
import '../../../core/widgets/custom_google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: BlocProvider.of<HomeCubit>(context)
              .screens[BlocProvider.of<HomeCubit>(context).currentIndex],
          bottomNavigationBar: CustomGNav(
            currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
            tabs: [
              GButton(
                icon: Icons.menu,
                text: AppStrings.menu.tr(context),
              ),
              GButton(
                icon: Icons.person,
                text: AppStrings.profile.tr(context),
                onPressed: (){
                  navigate(context: context, route: Routes.profile);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
