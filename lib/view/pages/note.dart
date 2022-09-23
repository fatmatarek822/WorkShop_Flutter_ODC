import 'package:flutter/material.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/pages/add_note.dart';
import 'package:odcworkshop2/view/pages/layout.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              navigateAndFinish(context, LayoutScreen());
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mainColor,
            )),
        title: const Text(
          'Add Note',
          style: TextStyle(
              color: blackColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text('There\'s No Data To Show'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context, const AddNote());
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
