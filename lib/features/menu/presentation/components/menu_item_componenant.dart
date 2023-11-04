import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/utils/app_strings.dart';
import 'package:chef_app_project/core/widgets/custom_alert_dialog.dart';
import 'package:chef_app_project/core/widgets/custom_loading_indecator.dart';
import 'package:chef_app_project/core/widgets/custom_network_image.dart';
import 'package:chef_app_project/features/menu/data/models/menu_model.dart';
import 'package:chef_app_project/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/menu_state.dart';

class MenuItemComponent extends StatelessWidget {
  const MenuItemComponent({
    super.key,
    required this.model,
  });

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: CustomCachedNetworkImage(imageUrl: model.images[0]),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(model.name),
            Text(model.description),
            Text(model.price.toString()),
          ],
        ),
        Spacer(),
        BlocConsumer<MenuCubit, MenuState>(
          listener: (context, state){
            if(state is DeleteDishSucessState){
              BlocProvider.of<MenuCubit>(context).getAllMeals();
            }
          },
          builder: (context, state) {
            return  IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                            message: AppStrings.deleteMeal.tr(context),
                            confirmAction: () {
                              BlocProvider.of<MenuCubit>(context)
                                  .deleteDish(model.id);
                              Navigator.pop(context);
                            });
                      });
                },
                icon: Icon(Icons.cancel));
          },
        ),
      ],
    );
  }
}
