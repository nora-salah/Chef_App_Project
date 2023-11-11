import 'package:chef_app_project/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/cubit/global_state.dart';
import '../../../../core/utils/app_strings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Row(
              children: [
                Text(
                  AppStrings.language.tr(context),
                ),
                const Spacer(),
                Switch(
                  activeColor: AppColors.primary,
                  value: BlocProvider.of<GlobalCubit>(context).switchOn,
                  onChanged: (value) {
                    BlocProvider.of<GlobalCubit>(context).switchLang(value);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
/*
*
* bool isSwitched = false;
* child: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        )
*/