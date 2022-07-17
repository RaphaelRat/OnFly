import 'package:get/get.dart';

import '../../data/model/user/user_model.dart';

class AuthController extends GetxController {
  late final Rx<User> user;
  final RxBool isUserAlreadySet = false.obs;

  static AuthController get instance => Get.find<AuthController>();
}
