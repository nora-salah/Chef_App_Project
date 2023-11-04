
abstract class MenuState {}

class MenuInitial extends MenuState {}
class ChangeItemState extends MenuState {}

class ChangeGroupValState extends MenuState {}

class AddDishLoadingState extends MenuState {}
class AddDishSucessState extends MenuState {}
class AddDishErrorState extends MenuState {}


class DeleteDishLoadingState extends MenuState {}
class DeleteDishSucessState extends MenuState {}
class DeleteDishErrorState extends MenuState {}


class GetAllChefMealLoadingState extends MenuState {}
class GetAllChefMealSucessState extends MenuState {}
class GetAllChefMealErrorState extends MenuState {}

class TakeImageFromUser extends MenuState {}
