import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/routes/app_routes.dart';
import 'package:chef_app_project/core/utils/commons.dart';
import 'package:chef_app_project/core/widgets/custom_loading_indecator.dart';
import 'package:chef_app_project/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../components/menu_item_componenant.dart';
import '../cubit/menu_state.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomButton(
              onPressed: () {
                navigate(context: context, route: Routes.addMeal);
              },
              text: AppStrings.addDishToMenu.tr(context)),
          BlocBuilder<MenuCubit, MenuState>(
            builder: (context, state) {
              final menuCubit = BlocProvider.of<MenuCubit>(context);

              return Expanded(
                child:state is GetAllChefMealLoadingState? CustomLoadingIndicator(): menuCubit.meals.isEmpty
                    ? Text("no meals")
                    : ListView.builder(
                        itemBuilder: (context, index) =>  Padding(
                          padding: EdgeInsets.all(8.0),
                          child: MenuItemComponent(
                            model: menuCubit.meals[index],
                          ),
                        ),
                        itemCount: menuCubit.meals.length,
                      ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
