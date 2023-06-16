import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planta/layout/presentation/screens/home_screen.dart';

import '../../screens/map_screen.dart';
import '../../screens/profile_screen.dart';
import '../../screens/result_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() :super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const MapScreen(),
    const ProfileScreen(),
    const ResultScreen(),
  ];

  void changeButtonNav({required int index}){
    currentTab = index;
    emit(LayoutChangeButtonNavState());
  }

}