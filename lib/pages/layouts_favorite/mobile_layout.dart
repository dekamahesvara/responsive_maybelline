import 'package:firstapi/controller/ctr_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileFavorite extends StatelessWidget {
  final ControllerDB controllerDB;

  const MobileFavorite({Key? key, required this.controllerDB})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controllerDB.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controllerDB.notes.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      Image.memory(
                        controllerDB.notes[index].img!,
                        width: 100,
                        height: 100,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controllerDB.notes[index].title!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () async {
                          controllerDB
                              .deleteNote(controllerDB.notes[index].title!);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
    });
  }
}
