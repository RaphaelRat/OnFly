import 'package:get/get.dart';

import '../../data/model/drone/drone.dart';
import '../../core/globals/globals.dart';

class HomeController extends GetxController {
  final user = AuthController.instance.user;

  @override
  void onInit() {
    drones.shuffle();

    super.onInit();
  }
}
