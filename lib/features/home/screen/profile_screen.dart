import 'package:chef_app_project/core/local/app_loacl.dart';
import 'package:chef_app_project/core/utils/app_strings.dart';
import 'package:chef_app_project/core/utils/commons.dart';
import 'package:chef_app_project/core/widgets/custom_button.dart';
import 'package:chef_app_project/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    AppAssets.profile,
                  ),
                  maxRadius: 100,
                ),
                          Text(AppStrings.myName,style: Theme.of(context).textTheme.displayLarge,),
                Text("nora88n3@gmail.com",style: Theme.of(context).textTheme.displaySmall,)

              ],
            )),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(AppStrings.editProfile.tr(context)),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text(AppStrings.password.tr(context)),
              onTap: (){},
            ),ListTile(
              leading: Icon(Icons.settings),
              title: Text(AppStrings.settings.tr(context)),
              onTap: (){
                navigate(context: context, route: Routes.setting);
              },
            ),ListTile(
              leading: Icon(Icons.logout),
              title: Text(AppStrings.logout.tr(context)),
              onTap: (){},
            ),
          ],
        )
      ),
      appBar: AppBar(
        title: Text(AppStrings.profile.tr(context)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  AppAssets.profile,
                ),
                maxRadius: 100,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hint: AppStrings.name.tr(context),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hint: AppStrings.phoneNumber.tr(context),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hint: AppStrings.brandName.tr(context),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hint: AppStrings.minimumCharge.tr(context),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hint: AppStrings.description.tr(context),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hint: AppStrings.location.tr(context),
              ),
              SizedBox(
                height: 34.h,
              ),
              CustomButton(
                  onPressed: () {}, text: AppStrings.updateProfile.tr(context)),
            ],
          ),
        ),
      ),
    );
  }
}
