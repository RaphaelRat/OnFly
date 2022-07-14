import 'package:get/get.dart';
import 'package:onfly/app/core/globals/auth_controller.dart';
import 'package:onfly/app/modules/login/login_page.dart';

class ProfileController extends GetxController {
  final user = AuthController.instance.user;

  void logout() {
    Get.offAllNamed(LoginPage.route);
  }
}
