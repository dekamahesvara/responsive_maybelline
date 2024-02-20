import 'package:firstapi/controller/ctr_db.dart';
import 'package:firstapi/controller/ctr_layout.dart';
import 'package:firstapi/pages/layouts_favorite/mobile_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllerLayout controllerLayout = Get.put(ControllerLayout());
    final ControllerDB controllerDB = Get.put(ControllerDB());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      // body: MobileFavorite(
      //   controllerDB: controllerDB,
      // )
      body: Obx(() => controllerLayout.isMobileLayout.value
          ? MobileFavorite(
              controllerDB: controllerDB,
            )
          : MobileFavorite(
              controllerDB: controllerDB,
            )),
    );
  }
}
