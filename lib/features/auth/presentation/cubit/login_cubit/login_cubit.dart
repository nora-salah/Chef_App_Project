import 'package:bloc/bloc.dart';
import 'package:chef_app_project/core/database/api/end_points.dart';
import 'package:chef_app_project/core/database/cache/cache_helper.dart';
import 'package:chef_app_project/features/auth/data/models/login_model.dart';
import 'package:chef_app_project/features/auth/data/repository/auth_reposatory.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/service_locator.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepository authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  bool isLoginPasswordsShowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;
    suffixIcon =
        isLoginPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

// login method
  LoginModel? loginModel;

  void login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((l) {
      emit(LoginErrorState(l));

    }, (r) async{
    await  sl<CacheHelper>().saveData(key: Apikeys.token, value: r.token);
      loginModel=r;
      emit(LoginSucessState());

    });
  }
}
