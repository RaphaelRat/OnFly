import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import './local_widgets/local_widgets.dart';
import './profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);
  static String route = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.almostWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                    onPressed: Get.back,
                    icon: const Icon(Icons.arrow_back_ios)),
              ],
            ),
            const SizedBox(height: 16),
            Hero(
              transitionOnUserGestures: true,
              tag: 'ProfilePicture',
              child: CircleAvatar(
                radius: 66,
                backgroundColor: AppColors.mainColor,
                child: CircleAvatar(
                  radius: 62,
                  backgroundColor: AppColors.whiteSmoke,
                  child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(controller.user.value.foto)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              controller.user.value.nome,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: AppColors.mainColor,
              ),
              child: Text('${controller.user.value.quantidadeDrone} drones',
                  style: const TextStyle(color: AppColors.whiteSmoke)),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  menuIcon(
                    texto: 'Editar perfil',
                    icone: Icons.edit,
                    funcao: () => showGetSnackbar(text: 'Em desenvolvimento'),
                  ),
                  const SizedBox(height: 24),
                  menuIcon(
                    texto: 'Mudar senha',
                    icone: Icons.key,
                    funcao: () => showGetSnackbar(text: 'Em desenvolvimento'),
                  ),
                  const SizedBox(height: 24),
                  menuIcon(
                      texto: 'Encerrar sessão',
                      icone: Icons.edit,
                      funcao: abrirDialog),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void abrirDialog() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        titlePadding: const EdgeInsets.symmetric(vertical: 16),
        title: 'Deseja encerrar sessão?',
        middleText:
            'Vai ser necessário fazer login novamente para acessar sua conta.',
        actions: [
          TextButton(
            child: const Text('Cancelar',
                style: TextStyle(fontSize: 16, color: AppColors.blackInactive)),
            onPressed: Get.back,
          ),
          TextButton(
            child: const Text('Sair',
                style: TextStyle(fontSize: 16, color: AppColors.mainColor)),
            onPressed: controller.logout,
          ),
        ]);
  }
}
