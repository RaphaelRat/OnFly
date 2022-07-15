import 'package:get/get.dart';
import 'package:onfly/app/data/model/drone/drone.dart';

class DroneController extends GetxController {
  late Drone drone;
  final isLoading = false.obs;

  @override
  void onInit() {
    drone = Get.arguments;

    super.onInit();
  }

  void enviar() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }
}
