import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';


Widget DefaultElvatedButton({
  required VoidCallback ontap,
  required String text,
}) =>
    SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          primary: mainColor, // b
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ), // ackground// foreground
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
      ),
    );

Widget DefaultOutlineButton({
  required String text,
  required VoidCallback function,
}) =>
    SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: mainColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
              color: mainColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget HorizonatalDividerWithText() => Row(
  children: const [
    Expanded(
      child: Divider(
        height: 5,
        indent: 15,
        endIndent: 15,
        color: Colors.black26,
      ),
    ),
    Text(
      'OR',
      style: TextStyle(fontSize: 15),
    ),
    Expanded(
      child: Divider(
        height: 5,
        indent: 15,
        endIndent: 15,
        color: Colors.black26,
      ),
    ),
  ],
);

Widget textCustom(
    {
      required TextEditingController controller,
      required TextInputType type,
      required String label,
      required String? Function(String?)? validate,
      VoidCallback? suffixpressed,
      VoidCallback? prefixpressed,
      bool isPassword = false,
      IconData? prefix,
      IconData? suffix,
    }) {
  return TextFormField(
       obscureText: isPassword,
       controller: controller,
       validator: validate,
       decoration: InputDecoration(
         prefixIcon: prefix != null
             ? IconButton(
             onPressed: prefixpressed,
             icon: Icon(
               prefix,
               color: mainColor,
             ))
             : null,
         suffixIcon: suffix != null
             ? IconButton(
             onPressed: suffixpressed,
             icon: Icon(
               suffix,
               color: mainColor,
             ))
             : null,
        labelText: label,
        border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: grayColor),
        borderRadius: BorderRadius.circular(15),
      ),
        enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: grayColor),
        borderRadius: BorderRadius.circular(15),
      ),
        focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: mainColor),
        borderRadius: BorderRadius.circular(15),
      ),
        errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: grayColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}


void showToast({
  required String text,
  required ToastStates state,
}) => Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: chooseToastColor(state),
  textColor: whiteColor,
  fontSize: 16.0,
);

//enum
enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color = SuccessColor;
      break;

    case ToastStates.ERROR:
      color = ErrorColor;
      break;

    case ToastStates.WARNING:
      color = WarningColor;
      break;
  }
  return color;
}


Widget HorizonatalDividerWithTexr() => Row(
  children: const [
    Expanded(
      child: Divider(
        height: 5,
        indent: 15,
        endIndent: 15,
        color: Colors.black26,
      ),
    ),
    Text(
      'OR',
      style: TextStyle(fontSize: 15),
    ),
    Expanded(
      child: Divider(
        height: 5,
        indent: 15,
        endIndent: 15,
        color: Colors.black26,
      ),
    ),
  ],
);