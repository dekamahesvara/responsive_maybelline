import 'dart:typed_data';

class Note {
  int? id;
  String? title;
  Uint8List? img;

  Note({this.id, this.title, this.img});

  Note.fromMap({required map})
      : id = map['id'],
        title = map['title'],
        img = map['img'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'img': img,
    };
  }
}
