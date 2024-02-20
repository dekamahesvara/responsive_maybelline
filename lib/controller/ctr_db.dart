import 'dart:typed_data';

import 'package:firstapi/db/db_helper.dart';
import 'package:firstapi/model/filedb.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class ControllerDB extends GetxController {
  Database? db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  RxList<Note> notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapNotes = await db!.query("Notes");
    notes.assignAll(mapNotes.map((e) => Note.fromMap(map: e)).toList());
    isLoading.value = false;
  }

  void createNote({
    required String title,
    required Uint8List img,
  }) async {
    try {
      isLoading.value = true;
      await db!.insert(
        'Notes',
        {
          'title': title,
          'img': img,
        },
      );
      getNotes();
    } catch (e) {
      print('Error inserting note: $e');
    }
  }

  void deleteNote(String name) async {
    await db!.delete("Notes", where: "title = ?", whereArgs: [name]);
    getNotes();
  }

  RxBool isLiked(String name) {
    return notes.any((note) => note.title == name).obs;
  }
}
