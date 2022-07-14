import 'package:get/get.dart';
import 'package:onfly/app/data/model/user/user.dart';

class AuthController extends GetxController {
  late final Rx<User> user;
  final RxBool isUserAlreadySet = false.obs;

  static AuthController get instance => Get.find<AuthController>();
}
