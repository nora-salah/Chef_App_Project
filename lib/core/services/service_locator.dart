import 'package:chef_app_project/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app_project/core/database/api/api_consumer.dart';
import 'package:chef_app_project/core/database/api/dio_consumer.dart';
import 'package:chef_app_project/core/database/cache/cache_helper.dart';
import 'package:chef_app_project/features/auth/data/repository/auth_reposatory.dart';
import 'package:chef_app_project/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app_project/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;
void initServiceLocator(){
sl.registerLazySingleton(() => GlobalCubit());
sl.registerLazySingleton(() => LoginCubit(sl()));
sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));

sl.registerLazySingleton(() => CacheHelper());
sl.registerLazySingleton(() => AuthRepository());

sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));

sl.registerLazySingleton(() => Dio());


}