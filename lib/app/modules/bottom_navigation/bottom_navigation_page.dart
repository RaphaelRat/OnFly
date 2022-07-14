import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onfly/app/core/theme/app_colors.dart';
import 'package:onfly/app/modules/bottom_navigation/bottom_navigation_controller.dart';
import 'package:onfly/app/modules/home/home_page.dart';
import 'package:onfly/app/modules/profile/profile_page.dart';
import 'package:onfly/app/modules/radar/radar_page.dart';

class BottomNavigationPage extends GetView<BottomNavigationController> {
  static String route = '/';

  const BottomNavigationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        children: const [
          HomePage(),
          RadarPage(),
          ProfilePage(),
        ],
        onPageChanged: controller.selectedIndex,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '', tooltip: 'Seus drones', activeIcon: Icon(Icons.home_sharp)),
            BottomNavigationBarItem(icon: Icon(Icons.radar), label: '', tooltip: 'Drones nas ruas'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: '', tooltip: 'Seus dados', activeIcon: Icon(Icons.person_sharp)),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease),
          selectedItemColor: AppColors.indigoA700dark,
          backgroundColor: AppColors.whiteSmoke,
          unselectedItemColor: AppColors.indigoA700,
        ),
      ),
    );
  }
}
