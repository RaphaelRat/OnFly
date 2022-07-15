import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onfly/app/core/theme/app_colors.dart';
import 'package:onfly/app/modules/home/local_widgets/drone_card.dart';

import './drone_controller.dart';

class DronePage extends GetView<DroneController> {
  const DronePage({Key? key}) : super(key: key);
  static String route = '/drone';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.almostWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                    onTap: Get.back,
                  ),
                  Expanded(
                    child: Text(
                      controller.drone.modelo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.blackSurface, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            droneCard(controller.drone, isDronePage: true),
          ],
        ),
      ),
    );
  }
}
