import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/utils/app_colors.dart';
import 'package:chef_app_project/core/utils/app_strings.dart';
import 'package:chef_app_project/core/widgets/custom_file_image.dart';
import 'package:chef_app_project/core/widgets/custom_loading_indecator.dart';
import 'package:chef_app_project/core/widgets/custom_text_form_field.dart';
import 'package:chef_app_project/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../components/image_packer_diaog.dart';
import '../cubit/menu_state.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addDishToMenu.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Center(
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {
                if (state is AddDishSucessState) {
                  showTwist(
                      message: AppStrings.mealAddedSucessfully.tr(context),
                      state: ToastStates.success);
                }
                Navigator.pop(context);
                BlocProvider.of<MenuCubit>(context).getAllMeals();
              },
              builder: (context, state) {
                final menuCubit = BlocProvider.of<MenuCubit>(context);
                return Form(
                  key: menuCubit.addToMenu,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CustomFileImage(
                            image: menuCubit.image,

                          ),
                          Positioned.directional(
                              textDirection: Directionality.of(context),
                              bottom: -8,
                              end: -8,
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return ImagePackerDialog(
                                            cameraOnTap: () {
                                              Navigator.pop(context);
                                              pickImage(ImageSource.camera)
                                                  .then((value) =>
                                                      menuCubit.takeImage(value));
                                            },
                                            galleryOnTap: () {
                                              Navigator.pop(context);

                                              pickImage(ImageSource.gallery)
                                                  .then((value) =>
                                                  menuCubit.takeImage(value));
                                            },
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 35,
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: menuCubit.mealNameController,
                        hint: AppStrings.mealName.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealName
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: menuCubit.mealPriceController,
                        hint: AppStrings.mealPrice.tr(context),
                        validate: (data) {
                          if (num.tryParse(data!) == null) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: menuCubit.mealDecController,
                        hint: AppStrings.mealDesc.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealDesc
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: DropdownButton(
                            isExpanded: true,
                            hint: Text(AppStrings.category.tr(context)),
                            value: menuCubit.selectedItem,
                            items: menuCubit.categoryList
                                .map((e) =>
                                    DropdownMenuItem(child: Text(e), value: e))
                                .toList(),
                            onChanged: (date) {
                              menuCubit.changeItem(date);
                            }),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 'quantity',
                                  groupValue: menuCubit.groupValue,
                                  activeColor: AppColors.primary,
                                  onChanged: (val) {
                                    menuCubit.changeGroupVal(val);
                                  }),
                              Text(AppStrings.mealQuantity.tr(context)),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Radio(
                                  value: 'number',
                                  groupValue: menuCubit.groupValue,
                                  activeColor: AppColors.primary,
                                  onChanged: (val) {
                                    menuCubit.changeGroupVal(val);
                                  }),
                              Text(AppStrings.mealNumber.tr(context)),
                            ],
                          ),
                        ],
                      ),
                      state is AddDishLoadingState
                          ? const CustomLoadingIndicator()
                          : CustomButton(
                              onPressed: () {
                                if (menuCubit.addToMenu.currentState!
                                    .validate()) {
                                  menuCubit.addDishToMenu();
                                }
                              },
                              text: AppStrings.addToMenu.tr(context)),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
