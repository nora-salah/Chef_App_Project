import 'package:chef_app_project/core/database/api/api_consumer.dart';
import 'package:chef_app_project/core/database/api/end_points.dart';
import 'package:chef_app_project/features/menu/data/models/menu_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/commons.dart';

class MenuRepository {
  Future<Either<String, String>> addDishToMenu({
    required XFile image,
    required String mealName,
    required String mealDec,
    required String mealCategory,
    required String howToSell,
    required double mealPrice,
  }) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoint.addMeal, isFormData: true, data: {
        Apikeys.name: mealName,
        Apikeys.category: mealCategory,
        Apikeys.price: mealPrice,
        Apikeys.description: mealDec,
        Apikeys.howToSell: howToSell,
        Apikeys.mealImages: await uploadImageToAPI(image),
      });
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> deleteMeal({
    required String id,
  }) async {
    try {
      final dynamic response = await sl<ApiConsumer>().delete(
        EndPoint.getDeleteMealEndPoints(id),
      );
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, GetAllMealModel>> getMeals() async {
    try {
      final dynamic response = await sl<ApiConsumer>().get(
        EndPoint.getAllChefMeals(sl<CacheHelper>().getData(key: Apikeys.id)),
      );
      return Right(GetAllMealModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
