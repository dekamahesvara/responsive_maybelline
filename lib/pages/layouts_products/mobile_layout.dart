import 'package:flutter/material.dart';
import 'package:firstapi/controller/ctr_api.dart';
import 'package:firstapi/controller/ctr_db.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class MobileProduct extends StatelessWidget {
  final ControllerApi controllerApi;
  final ControllerDB controllerDB;

  const MobileProduct({
    Key? key,
    required this.controllerApi,
    required this.controllerDB,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controllerApi.isOffline.value
          ? const Center(
              child: Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          : controllerApi.belajarApi.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controllerApi.belajarApi.length,
                  itemBuilder: (context, index) {
                    final data = controllerApi.belajarApi[index];

                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        children: [
                          Image.network(
                            data.imageLink,
                            width: 100,
                            height: 100,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                data.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Obx(() => Icon(
                                  controllerDB.isLiked(data.name).value
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: controllerDB.isLiked(data.name).value
                                      ? Colors.red
                                      : Colors.grey,
                                )),
                            onPressed: () async {
                              var img = await get(Uri.parse(data.imageLink));
                              var bytes = img.bodyBytes;
                              if (controllerDB.isLiked(data.name).value) {
                                controllerDB.deleteNote(data.name);
                              } else {
                                controllerDB.createNote(
                                  title: data.name,
                                  img: bytes,
                                );
                              }
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
