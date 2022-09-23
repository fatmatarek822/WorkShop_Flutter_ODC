import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view/component/pages_components/add_note.dart';
import 'package:odcworkshop2/view_model/add_note/add_note_cubit.dart';
import 'package:odcworkshop2/view_model/add_note/add_note_state.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state){},
        builder: (context, state){

          AddNoteCubit cubit = AddNoteCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: whiteColor,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
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
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    NoteFormFeild(
                      text: 'Title',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NoteFormFeild(
                      text: 'Date',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NoteFormFeild(
                      text: 'Note',
                      maxline: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(text: '+ Add'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
