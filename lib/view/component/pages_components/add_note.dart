import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';

Widget NoteFormFeild({
  String? Function(String?)? validate,
  TextEditingController? controller,
  required String text,
  bool? readOnly ,
  bool? enabled,
  int? maxline,
}) =>
    TextFormField(
      controller: controller,
      maxLines: maxline,
      cursorColor: mainColor,
      validator: validate,
      decoration: InputDecoration(
        label: Text(
          text,
        ),
        labelStyle: TextStyle(color: Colors.grey[600]),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: grayColor),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: mainColor, width: 2.0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: ErrorColor,
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
      ),
    );

Widget Button({
  required String text,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(grayColor),
      ),
      onPressed: () {},
      child: Text(text),
    );
