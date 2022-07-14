import 'package:get/get.dart';
import 'package:onfly/app/core/globals/auth_controller.dart';

class GlobalBindings extends Bindings {
  GlobalBindings();

  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
