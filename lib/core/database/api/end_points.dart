class EndPoint {
  static const String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const String chefSignIn = 'chef/signin';
  static const String chefChangePassword = 'chef/change-password';
  static const String chefDelete = 'chef/delete';
  static const String chefGet = 'chef/get-chef/';
  static const String chefSendCode = 'chef/send-code';
  static const String chefForgetPassword = 'chef/change-forgotten-password';
  static const String updateChef = 'chef/update';
  static const String logout = 'chef/logout';
  static const String addMeal = 'meal/add-to-menu';
  static const String updateMeal = 'chef/update-meal/';
  static const String getAllMeal = 'meal/get-meals';
  static const String deleteMeal = 'meal/delete-meal/';

  static String getChefDataEndPoints(id) {
    return '$chefGet$id';
  }

  static String getUpdateMealEndPoints(id) {
    return '$updateMeal$id';
  }

  static String getDeleteMealEndPoints(id) {
    return '$deleteMeal$id';
  }
  static String getAllChefMeals(id) {
    return 'chef/get-chef/$id/meals';
  }
}

class Apikeys {
  static const String email = 'email';
  static const String id = 'id';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
  static const String message = 'message';
  static const String token = 'token';
  static const String code = 'code';
  static const String name = 'name';
  static const String description = 'description';
  static const String price = 'price';
  static const String category = 'category';
  static const String mealImages = 'mealImages';
  static const String howToSell = 'howToSell';
  static const String phone = 'phone';
  static const String brandName = 'brandName';
  static const String minCharge = 'minCharge';
  static const String disc = 'disc';
  static const String location = 'location';
  static const String profilePic = 'profilePic';
  static const String oldPass = 'oldPass';
  static const String newPass = 'newPass';
  static const String chef = 'chef';

  

}
