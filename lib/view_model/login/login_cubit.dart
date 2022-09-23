import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odcworkshop2/model/login.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';

import '../database/network/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }


  LoginCubit get(context) => BlocProvider.of(context);
  String  message = "";
  LoginModel ? user ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login () async{
    var json = {
      "email" : emailController.text.toString(),
      "password" : passwordController.text.toString()
    };
    await DioHelper.postData(url: loginEndPoint, data: json).then((value) {
      print(value.data);
        user = LoginModel.fromJson(value.data);
        message = user!.message.toString();
      emit(LoginSuccess(user!));

    }).catchError((e){
      message= "Error";
      emit(LoginError());
    });
  }




}
