import 'package:get/get.dart';

import '../../data/model/drone/drone.dart';

class MapController extends GetxController {
  late Drone drone;
  final isLoading = false.obs;

  @override
  void onInit() {
    drone = Get.arguments;
    super.onInit();
  }

  void voltarDrone() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }
}
