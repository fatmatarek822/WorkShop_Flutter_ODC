
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/model/register.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';
import 'package:odcworkshop2/view_model/login/login_cubit.dart';
import 'package:odcworkshop2/view_model/register/register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


//  String? dropdownvalue = 'Male';
  List<DropdownMenuItem<String>> genders = [
    DropdownMenuItem(child: Text('m'), value: 'm',),
    DropdownMenuItem(child: Text('f'), value: 'f',),
  ];

  List<DropdownMenuItem<int>> grades = [
    DropdownMenuItem(child: Text('1'), value: 1,),
    DropdownMenuItem(child: Text('2'), value: 2,),
    DropdownMenuItem(child: Text('3'), value: 3,),
    DropdownMenuItem(child: Text('3'), value: 4,),
  ];

  List<DropdownMenuItem<String>> university = [
    DropdownMenuItem(child: Text('Cairo'), value: 'Cairo',),
    DropdownMenuItem(child: Text('Helwan'), value: 'Hewan',),

  ];


  // void ChangeDropDown1(String? newValue){
  //   dropdownvalue = newValue;
  //   emit(ChangeDropDownState());
  // }
  // void ChangeDropDown2(String? newValue){
  //   dropdownvalue1 = newValue;
  //   emit(ChangeDropDownState());
  // }
  // void ChangeDropDown3(String? newValue){
  //   dropdownvalue2 = newValue;
  //   emit(ChangeDropDownState());
  // }






  String? dropdownvalue = 'Male';
  List<String> Gender = [
    'Male',
    'Female',
  ];


  String? dropdownvalue1 = 'AUC';
  List<String> University = [
    'AUC',
    'Helwan',
    'Cairo',
  ];

  String? dropdownvalue2 = 'A';
  List<String> Grade = [
    'A',
    'B',
    'C',
    'D',
  ];


  void ChangeDropDown1(String? newValue){
    dropdownvalue = newValue;
    emit(ChangeDropDownState());
  }

  void ChangeDropDown2(String? newValue){
    dropdownvalue1 = newValue;
    emit(ChangeDropDownState());
  }
  void ChangeDropDown3(String? newValue){
    dropdownvalue2 = newValue;
    emit(ChangeDropDownState());
  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityRegisterState());
  }


  RegisterCubit get(context) => BlocProvider.of(context);
  String  message = "";
  RegisterModel ? registermodel;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> Register () async{
    var json = {
      "email" : emailController.text.toString(),
      "password" : passwordController.text.toString(),
      "name" : nameController.text.toString(),
      "gender" : 'f',
      "phoneNumber" : phoneController.text.toString(),
      "universityId" : 1,
      "gradeId": 4,
      "roleId": 2,
    };
    await DioHelper.postData(url: registerEndPoint, data: json).then((value) {
      print(value.data);
      registermodel = RegisterModel.fromJson(value.data);
      message = registermodel!.message.toString();
      emit(RegisterSuccess(registermodel!));

    }).catchError((e){
      message= "Error";
      print(e.toString());
      emit(RegisterError());
    });
  }









}




/*
class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  String? dropdownvalue = 'Male';
  List<String> Gender = [
    'Male',
    'Female',
  ];

  String? dropdownvalue1 = 'AUC';
  List<String> University = [
    'AUC',
    'Helwan',
    'Cairo',
  ];

  String? dropdownvalue2 = 'A';
  List<String> Grade = [
    'A',
    'B',
    'C',
    'D',
  ];


  void ChangeDropDown1(String? newValue){
  dropdownvalue = newValue;
  emit(ChangeDropDownState());
}
  void ChangeDropDown2(String? newValue){
    dropdownvalue1 = newValue;
    emit(ChangeDropDownState());
  }
  void ChangeDropDown3(String? newValue){
    dropdownvalue2 = newValue;
    emit(ChangeDropDownState());
  }


}
 */