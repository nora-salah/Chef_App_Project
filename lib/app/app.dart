import 'package:chef_app_project/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app_project/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/bloc/cubit/global_state.dart';
import '../core/local/app_loacl.dart';
import '../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      builder: (context, child) =>
          BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate,

                ],
                supportedLocales: [
                  Locale('ar', 'EG'),
                  Locale('en', 'US'),

                ],
                locale:Locale(BlocProvider.of<GlobalCubit>(context).langCode),
                title: 'Flutter Demo',
                initialRoute: Routes.initialRoute,
                onGenerateRoute: AppRoutes.generateRoute,
                theme: getAppTheme(),
                debugShowCheckedModeBanner: false,

              );
            },
          ),
    );
  }
}
