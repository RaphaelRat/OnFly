import 'package:get/get.dart';
import 'package:onfly/app/core/utils/snackbar.dart';

import '../../data/model/drone/drone.dart';

class MapController extends GetxController {
  late Rx<Drone> drone;
  final isLoading = false.obs;

  @override
  void onInit() {
    drone = Get.arguments;
    super.onInit();
  }

  void voltarDrone() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    drone.value.estaNoRadar = false;
    drone.refresh();
    isLoading.value = false;
    Get.back();
    showGetSnackbar(text: 'Drone retornado!', duration: 2);
  }
}
