import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/snackbar.dart';
import '../../data/model/drone/drone_mock.dart';
import './local_widgets/drone_card.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.almostWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.indigoA700,
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: AppColors.whiteSmoke,
                      child: CircleAvatar(
                          radius: 20,
                          backgroundImage: controller.user.value.nome == 'Raphael Abreu'
                              ? const AssetImage('assets/images/raphael.jpg')
                              : const AssetImage('assets/images/nicolas.jpg')),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showGetSnackbar(text: 'Em desenvolvimento'),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.indigoA700,
                          border: Border.all(color: AppColors.indigoA700),
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))),
                      child: Row(
                        children: const [
                          Icon(Icons.notifications_none_rounded, color: AppColors.whiteSmoke),
                          SizedBox(width: 8),
                          Icon(Icons.settings_outlined, color: AppColors.whiteSmoke),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Olá, ${controller.user.value.nome}',
                style: const TextStyle(color: AppColors.indigoA200, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 6),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Com qual drone deseja realizar sua entrega?',
                style: TextStyle(color: AppColors.indigoA700, fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => droneCard(drones[index].obs),
                itemCount: controller.user.value.quantidadeDrone,
              ),
            )
          ],
        ),
      ),
    );
  }
}
