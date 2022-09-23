import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/pages/login.dart';
import 'package:odcworkshop2/view_model/database/network/local/cache_helper.dart';
import 'package:odcworkshop2/view_model/setting/setting_state.dart';

class SettingCubit extends Cubit<SettingState>{
  SettingCubit() : super(SettingInitial());

  static SettingCubit get(context) => BlocProvider.of(context);



  void showMaterialDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            content: Text('Are You Sure ?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog(context);
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                    CacheHelper.removeData(key: 'accessToken').then((value) {
                      if (value) {
                        navigateAndFinish(
                          context,
                          Login(),
                        );
                      }
                    });
                    emit(LogOutSuccess());
                },
                child: Text('Logout'),
              )
            ],
          );
        });
  }

  _dismissDialog(context) {
    Navigator.pop(context);
    emit(ShowDilaog());
  }

}



