
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

final class ChangeNewPasswordSuffixIcon extends ForgetPasswordState {}
final class ChangeConfirmPasswordSuffixIcon extends ForgetPasswordState {}

final class SendCodeLoadingState extends ForgetPasswordState {}
 final class SendCodeSucessState extends ForgetPasswordState {
final String massage;

  SendCodeSucessState(this.massage);

}
 final class SendCodeErrorState extends ForgetPasswordState{
final String massage;

SendCodeErrorState(this.massage);}



final class ResetPasswordLoadingState extends ForgetPasswordState {}
final class ResetPasswordSuccessState extends ForgetPasswordState {
final String message;

ResetPasswordSuccessState(this.message);
}
final class ResetPasswordErrorState extends ForgetPasswordState {
final String message;

ResetPasswordErrorState(this.message);
}
