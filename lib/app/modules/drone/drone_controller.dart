import 'package:get/get.dart';
import 'package:onfly/app/data/model/drone/drone.dart';

class DroneController extends GetxController {
  late Drone drone;

  @override
  void onInit() {
    drone = Get.arguments;

    super.onInit();
  }
}
