import 'package:chef_app_project/core/database/api/api_consumer.dart';
import 'package:chef_app_project/core/database/api/end_points.dart';
import 'package:chef_app_project/core/error/exception.dart';
import 'package:chef_app_project/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/service_locator.dart';

class AuthRepository {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.chefSignIn, data: {
        Apikeys.email: email,
        Apikeys.password: password,
      });
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoint.chefSendCode, data: {Apikeys.email: email});
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return (Left(e.toString()));
    }
  }

  Future<Either<String, String>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
  }) async {
    try {
      final response =
          await sl<ApiConsumer>().patch(EndPoint.chefForgetPassword, data: {
        Apikeys.email: email,
        Apikeys.password: password,
        Apikeys.confirmPassword: confirmPassword,
        Apikeys.code: code,
      });
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return (Left(e.toString()));
    }
  }
}
