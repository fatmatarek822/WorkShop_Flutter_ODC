import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/view/pages/home.dart';
import 'package:odcworkshop2/view/pages/news.dart';
import 'package:odcworkshop2/view/pages/setting.dart';
import 'package:odcworkshop2/view_model/layout/layout_state.dart';

class LayoutCubit extends Cubit<LayoutState>{
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex =0;

  List<Widget> pages =[
    HomeScreen(),
    NewsScreen(),
    SettingsScreen(),
  ];

  void ChangeBottomNav (index)
  {
    currentIndex = index;
    emit(ChangeBottomNavBarSuccess());
  }


}