sealed class LoginState {}

class LoginInitial extends LoginState {}

final class ChangeLoginPasswordSuffixIcon extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSucessState extends LoginState {}
final class LoginErrorState extends LoginState {
  final String massage;

  LoginErrorState(this.massage);}

