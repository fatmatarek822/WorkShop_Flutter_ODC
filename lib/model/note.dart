class Note {
  String name = "";
  String description = "";
  int id = -1;
  Note();

  Note.fromDbMap(Map<String, dynamic> map) {
    name = map['title'];
    description = map['description'];
    id = map['id'];
  }

}
