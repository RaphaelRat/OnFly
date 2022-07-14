import 'package:get/get.dart';
import 'package:onfly/app/modules/bottom_navigation/bottom_navigation_controller.dart';
import 'package:onfly/app/modules/bottom_navigation/bottom_navigation_page.dart';
import 'package:onfly/app/modules/home/home_controller.dart';
import 'package:onfly/app/modules/login/login_controller.dart';
import 'package:onfly/app/modules/login/login_page.dart';
import 'package:onfly/app/modules/profile/profile_controller.dart';
import 'package:onfly/app/modules/radar/radar_controller.dart';

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
  ];
}
