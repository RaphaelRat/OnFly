import 'package:get/get.dart';
import 'package:onfly/app/data/model/drone/drone_mock.dart';

import '../../core/globals/auth_controller.dart';

class HomeController extends GetxController {
  final user = AuthController.instance.user;

  @override
  void onInit() {
    drones.shuffle();

    super.onInit();
  }
}
