import 'package:get/get.dart';
import 'package:onfly/app/modules/map/map_controller.dart';
import 'package:onfly/app/modules/map/map_page.dart';

import '../modules/bottom_navigation/bottom_navigation_controller.dart';
import '../modules/bottom_navigation/bottom_navigation_page.dart';
import '../modules/drone/drone_controller.dart';
import '../modules/drone/drone_page.dart';
import '../modules/home/home_controller.dart';
import '../modules/login/login_controller.dart';
import '../modules/login/login_page.dart';
import '../modules/profile/profile_controller.dart';
import '../modules/radar/radar_controller.dart';

List<GetPage> getAppPages() {
  return [
    GetPage(
      name: LoginPage.route,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() => Get.lazyPut<LoginController>(() => LoginController())),
    ),
    GetPage(
      name: BottomNavigationPage.route,
      page: () => const BottomNavigationPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut<BottomNavigationController>(() => BottomNavigationController())),
        BindingsBuilder(() => Get.lazyPut<HomeController>(() => HomeController())),
        BindingsBuilder(() => Get.lazyPut<RadarController>(() => RadarController())),
        BindingsBuilder(() => Get.lazyPut<ProfileController>(() => ProfileController())),
      ],
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
