import 'package:firstapi/controller/ctr_layout.dart';
import 'package:firstapi/layouts_favorite/mobile_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutController layoutController = Get.put(LayoutController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() => layoutController.isMobileLayout.value
          ? MobileFavorite()
          : MobileFavorite()),
    );
  }
}
