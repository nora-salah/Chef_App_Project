
import 'package:chef_app_project/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app_project/core/database/cache/cache_helper.dart';
import 'package:chef_app_project/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app_project/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:chef_app_project/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app_project/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/services/service_locator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();

  await sl<CacheHelper>().init();
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>sl<GlobalCubit>()..getCachedLang()),
        BlocProvider(create: (context)=>sl<LoginCubit>()),
        BlocProvider(create: (context)=>sl<ForgetPasswordCubit>()),
        BlocProvider(create: (context)=>sl<HomeCubit>()),
        BlocProvider(create: (context)=>sl<MenuCubit>()..getAllMeals()),


      ],
      child:const MyApp()));
}

