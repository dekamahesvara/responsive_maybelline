import 'package:firstapi/controller/ctr_api.dart';
import 'package:firstapi/controller/ctr_db.dart';
import 'package:firstapi/controller/ctr_layout.dart';
import 'package:firstapi/pages/favorite.dart';
import 'package:firstapi/pages/layouts_products/mobile_layout.dart';
import 'package:firstapi/pages/layouts_products/tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllerApi controllerApi = Get.put(ControllerApi());
    final ControllerDB controllerDB = Get.put(ControllerDB());
    final ControllerLayout controllerLayout = Get.put(ControllerLayout());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Favorite()),
          );
        },
        child: const Icon(Icons.favorite, color: Colors.red, size: 35),
      ),
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      // body: MobileProduct(
      //   controllerApi: controllerApi,
      //   controllerDB: controllerDB,
      // )
      body: Obx(() => controllerLayout.isMobileLayout.value
          ? MobileProduct(
              controllerApi: controllerApi,
              controllerDB: controllerDB,
            )
          : TabletProduct(
              controllerApi: controllerApi,
              controllerDB: controllerDB,
            )),
    );
  }
}
