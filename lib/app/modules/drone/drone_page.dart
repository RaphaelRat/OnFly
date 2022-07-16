import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/snackbar.dart';
import '../../global_widgets/drone_card.dart';
import './local_widgets/form_drone.dart';
import './local_widgets/radar_map.dart';
import './drone_controller.dart';

class DronePage extends GetView<DroneController> {
  const DronePage({Key? key}) : super(key: key);
  static String route = '/drone';

  @override
  Widget build(BuildContext context) {
    final droneFormKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.indigoA700,
        appBar: AppBar(
          title: Text(
            controller.drone.value.modelo,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.whiteSmoke, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                child: const Icon(Icons.settings, color: Colors.white),
                onTap: () => showGetSnackbar(text: 'Em desenvolvimento'),
              ),
            ),
          ],
          backgroundColor: AppColors.indigoA700,
          elevation: 0,
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    droneCard(controller.drone, isDronePage: true),
                    const SizedBox(height: 24),
                    const Divider(thickness: 1, height: 0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          color: AppColors.whiteSmoke,
                        ),
                        child: Obx(
                          () => controller.drone.value.estaNoRadar
                              ? radarMap(controller.drone)
                              : formDrone(context: context, droneFormKey: droneFormKey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
