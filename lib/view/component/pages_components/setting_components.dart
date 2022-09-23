import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget divider()=> Divider(
  height: 1,
  indent: 15,
  endIndent: 15,
  color: Colors.black26,
);

Widget DefaultListTile({
  required String text,
}) => ListTile(
  title: Text(
    text,
  ),
  trailing: Icon(
    Icons.arrow_forward_ios,
    size: 22,
  ),
);