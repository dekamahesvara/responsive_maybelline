import 'package:firstapi/controller/ctr_api.dart';
import 'package:firstapi/controller/ctr_layout.dart';
import 'package:firstapi/favorite.dart';
import 'package:firstapi/layouts_products/mobile_layout.dart';
import 'package:firstapi/layouts_products/tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  final ControllerApi controllerApi = Get.put(ControllerApi());

  Products({super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutController layoutController = Get.put(LayoutController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red, size: 35),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorite()),
              );
            },
          ),
        ],
      ),
      body: Obx(() => layoutController.isMobileLayout.value
          ? MobileProduct(
              controllerApi: controllerApi,
            )
          : TabletProduct(controllerApi: controllerApi)),
    );
  }
}
