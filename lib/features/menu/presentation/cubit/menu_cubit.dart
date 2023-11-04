import 'package:chef_app_project/features/menu/data/repository/menu_reposatry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/menu_model.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepository) : super(MenuInitial());
  final MenuRepository menuRepository;
  XFile? image;
  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealPriceController = TextEditingController();
  TextEditingController mealDecController = TextEditingController();
  GlobalKey<FormState> addToMenu = GlobalKey<FormState>();

  List categoryList = [
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamb',
    'Vegetarian',
    'Vegan',
    'Gluten-free',
  ];
  String selectedItem = 'Beef';

  void changeItem(item) {
    selectedItem = item;
    emit(ChangeItemState());
  }

  String groupValue = "quantity";

  void changeGroupVal(val) {
    groupValue = val;
    emit(ChangeGroupValState());
  }

  void addDishToMenu() async {
    emit(AddDishLoadingState());
    final res = await menuRepository.addDishToMenu(
      image: image!,
      mealName: mealNameController.text,
      mealDec: mealDecController.text,
      mealCategory: selectedItem,
      howToSell: groupValue,
      mealPrice: double.parse(mealPriceController.text),
    );
    res.fold(
        (l) => emit(AddDishErrorState()), (r) => emit(AddDishSucessState()));
  }

  void deleteDish(id) async {
    emit(DeleteDishLoadingState());
    final res = await menuRepository.deleteMeal(
      id: id,
    );
    res.fold((l) => emit(DeleteDishErrorState()),
        (r) => emit(DeleteDishSucessState()));
  } 
  
List <MealModel> meals=[];
  void getAllMeals() async {
    emit(GetAllChefMealErrorState());
    final res = await menuRepository.getMeals();
    res.fold((l) => emit(GetAllChefMealErrorState()),
        (r) {
           meals=r.meals;
          emit(GetAllChefMealSucessState());
        });
  }

  void takeImage(value){
    image=value;
    emit(TakeImageFromUser());
  }
}
