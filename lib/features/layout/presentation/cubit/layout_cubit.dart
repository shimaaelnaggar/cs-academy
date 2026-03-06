import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  List<Widget> views = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('My Courses Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
