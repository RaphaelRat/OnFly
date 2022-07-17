import 'package:get/get.dart';

import 'package:onfly/app/modules/home/home_page.dart';
import 'package:onfly/app/modules/map/map_controller.dart';
import 'package:onfly/app/modules/map/map_page.dart';
import 'package:onfly/app/modules/profile/profile_page.dart';

import '../modules/drone/drone_controller.dart';
import '../modules/drone/drone_page.dart';
import '../modules/home/home_controller.dart';
import '../modules/login/login_controller.dart';
import '../modules/login/login_page.dart';
import '../modules/profile/profile_controller.dart';

List<GetPage> getAppPages() {
  return [
    GetPage(
      name: LoginPage.route,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() => Get.lazyPut<LoginController>(() => LoginController())),
    ),
    GetPage(
      name: HomePage.route,
      page: () => const HomePage(),
      binding: BindingsBuilder(() => Get.lazyPut<HomeController>(() => HomeController())),
    ),
    GetPage(
      name: ProfilePage.route,
      transition: Transition.fadeIn,
      page: () => const ProfilePage(),
      binding: BindingsBuilder(() => Get.lazyPut<ProfileController>(() => ProfileController())),
    ),
    GetPage(
      name: DronePage.route,
      page: () => const DronePage(),
      binding: BindingsBuilder(() => Get.lazyPut<DroneController>(() => DroneController())),
    ),
    GetPage(
      name: MapPage.route,
      page: () => const MapPage(),
      binding: BindingsBuilder(() => Get.lazyPut<MapController>(() => MapController())),
    ),
  ];
}
