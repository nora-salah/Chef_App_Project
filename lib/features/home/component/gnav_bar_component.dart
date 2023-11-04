import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../home_cubit/home_cubit.dart';

class GNavBar extends StatelessWidget {
  const GNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      tabs: [
        GButton(
          icon: Icons.menu,
          text: AppStrings.menu.tr(context),
        ),
        GButton(
          icon: Icons.person,
          text: AppStrings.profile.tr(context),
        ),
      ],
      padding: const EdgeInsets.all(16),
      tabBackgroundColor: AppColors.black12,
      tabBorderRadius: 16.0,
      gap: 8,
      activeColor: AppColors.primary,
      selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
      onTabChange: (value) {
        BlocProvider.of<HomeCubit>(context).changeIndex(value);
      },
    );
  }
}
