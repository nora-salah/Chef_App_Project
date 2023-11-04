import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key, required this.message, required this.confirmAction}) : super(key: key);
  final String message;
  final VoidCallback confirmAction;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColors.black),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.cancel.tr(context),
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.black),
          ),
        ),
        TextButton(
          onPressed:confirmAction ,
          child: Text(
              AppStrings.ok.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.black)
          ),
        ),

      ],
    );
  }
}
