import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/model/note.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/component/pages_components/add_note.dart';
import 'package:odcworkshop2/view/pages/note.dart';
import 'package:odcworkshop2/view_model/add_note/add_note_cubit.dart';
import 'package:odcworkshop2/view_model/add_note/add_note_state.dart';
import 'package:odcworkshop2/view_model/database/sql.dart';

class AddNote extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  AddNote();

  AddNote.withNote(this.noteDetail) {
    nameEt.text = noteDetail!.name;
    descriptionEt.text = noteDetail!.description;
  }

  Note? noteDetail;

  TextEditingController nameEt = TextEditingController();
  TextEditingController descriptionEt = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                NoteFormFeild(
                  text: 'Title',
                  controller: nameEt,
                  validate: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Please Enter title of note';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                NoteFormFeild(
                  text: 'Note',
                  maxline: 5,
                  controller: descriptionEt,
                  validate: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Please Enter Describtion of note';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // Button(text: '+ Add'),


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                  ),
                  onPressed: () {
                    if (noteDetail == null) {

                      SQLHelper.addNote(
                          nameEt.text.toString(), descriptionEt.text.toString());
                      navigateTo(context, NoteScreen());
                    } else {

                      SQLHelper.updateNote(noteDetail!.id,
                          nameEt.text.toString(), descriptionEt.text.toString());
                      navigateTo(context, NoteScreen());
                    }
                  },
                  child: Text(noteDetail == null ? "+ Add Note" : "Update"),
                ),
                noteDetail == null
                    ? SizedBox()
                    : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                     ),
                       onPressed: () {
                      //todo delete note from ui
                      SQLHelper.deleteNote(noteDetail!.id);

                      Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new NoteScreen()));
                     },
                     child: Text("Delete"),
                  ),


              ],
            ),
          ),
        ),
      ),
    );

  }
}
