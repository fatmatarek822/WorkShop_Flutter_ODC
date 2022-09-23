
import 'package:odcworkshop2/model/register.dart';
import 'package:odcworkshop2/view/pages/register.dart';

abstract class RegisterState {}
class RegisterInitial extends RegisterState{}

class ChangeDropDownState extends RegisterState{}

class RegisterSuccess extends RegisterState {
  final RegisterModel registermodel;
  RegisterSuccess(this.registermodel);
}

class RegisterError extends RegisterState {}

class ChangePasswordVisibilityRegisterState extends RegisterState{}