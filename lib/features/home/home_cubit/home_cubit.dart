import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../menu/presentation/screens/menu_home_screen.dart';
import '../screen/profile_screen.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> screens=[MenuHomeScreen(),ProfileScreen()];
  int currentIndex=0;
  void changeIndex(index){
    currentIndex=index;
      emit(ChangeIndexState());
  }

}
