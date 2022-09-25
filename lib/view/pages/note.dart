import 'package:flutter/material.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/model/note.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/pages/add_note.dart';
import 'package:odcworkshop2/view/pages/layout.dart';
import 'package:odcworkshop2/view_model/database/sql.dart';

class NoteScreen extends StatefulWidget {
   NoteScreen({Key? key}) : super(key: key);


  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {


  List<Note> allNotes = [];

  @override
  void initState() {
    SQLHelper.initDb();
    getAllNotes();
  }


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
          'Note',
          style: TextStyle(
              color: blackColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: allNotes.length == 0
            ? Center(
              child: Text('There\'s No Data To show', style: TextStyle(fontSize: 22),),
            )
            : Column(
          children: [
            Text(
              "All Notes ",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allNotes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => new AddNote.withNote(allNotes[index])));
                          },
                          leading: Icon(Icons.note_alt),
                          title: Text(allNotes[index].name),
                          subtitle: Text(allNotes[index].description),
                        ),

                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new AddNote()));
        },
        child: Icon(Icons.add),
      ),
    );
  }



  void getAllNotes()  {
    //todo get plants from db
    SQLHelper.getNotes().then((value) {
      for (int i = 0; i < value.length; i++) {
        setState(() {
          allNotes.add(Note.fromDbMap(value[i]));
        });
      }
    });
  }

}
