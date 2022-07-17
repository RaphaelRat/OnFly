import 'package:get/get.dart';

import '../../core/globals/globals.dart';
import '../login/login_page.dart';

class ProfileController extends GetxController {
  final user = AuthController.instance.user;

  void logout() {
    Get.offAllNamed(LoginPage.route);
  }
}
