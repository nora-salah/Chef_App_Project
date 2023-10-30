import 'package:bloc/bloc.dart';
import 'package:chef_app_project/features/auth/data/repository/auth_reposatory.dart';
import 'package:flutter/material.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());
  final AuthRepository authRepository;
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();

  void sendCode() async {
    emit(SendCodeLoadingState());
    final res = await authRepository.sendCode(emailController.text);
    res.fold((l) => emit(SendCodeErrorState(l)),
        (r) => emit(SendCodeSucessState(r)));
  }

  // reset new password logic

  TextEditingController newPasswordController = TextEditingController();
  bool isNewPasswordShowing = true;
  IconData suffixIconPassword = Icons.visibility;
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();

  void changeNewPasswordSuffixIcon() {
    isNewPasswordShowing = !isNewPasswordShowing;
    suffixIconPassword =
        isNewPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

// reset confirm password logic

  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;

  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordShowing = !isConfirmPasswordShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

// code
  TextEditingController codeController = TextEditingController();

//reset password....
  void resetPassword() async {
    emit(ResetPasswordLoadingState());
    final res = await authRepository.resetPassword(
      email: emailController.text,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
      code: codeController.text,
    );
    res.fold((l) => emit(ResetPasswordErrorState(l)),
        (r) => emit(ResetPasswordSuccessState(r)));
  }
}
