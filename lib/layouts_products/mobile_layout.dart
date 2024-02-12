import 'package:firstapi/controller/ctr_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MobileProduct extends StatelessWidget {
  final ControllerApi controllerApi;
  const MobileProduct({Key? key, required this.controllerApi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controllerApi.belajarApi.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controllerApi.belajarApi.length,
              itemBuilder: (context, index) {
                final data = controllerApi.belajarApi[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image.network(
                        data.imageLink,
                        width: 200,
                        height: 200,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: const Icon(
                                  Icons.favorite_outline_rounded,
                                  size: 35,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
    });
  }
}
