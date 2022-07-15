import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onfly/app/core/theme/app_colors.dart';
import 'package:onfly/app/core/theme/form_field_input_decoration.dart';
import 'package:onfly/app/core/utils/snackbar.dart';
import 'package:onfly/app/modules/home/local_widgets/drone_card.dart';

import './drone_controller.dart';

class DronePage extends GetView<DroneController> {
  const DronePage({Key? key}) : super(key: key);
  static String route = '/drone';

  @override
  Widget build(BuildContext context) {
    final droneFormKey = GlobalKey<FormState>();
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.indigoA700,
          appBar: AppBar(
            title: Text(
              controller.drone.modelo,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.whiteSmoke, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  child: const Icon(Icons.settings, color: Colors.white),
                  onTap: () => showGetSnackbar(text: 'Em desenvolvimento'),
                ),
              ),
            ],
            backgroundColor: AppColors.indigoA700,
            elevation: 0,
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  droneCard(controller.drone, isDronePage: true),
                  const SizedBox(height: 24),
                  const Divider(thickness: 1, height: 0),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      color: AppColors.whiteSmoke,
                    ),
                    child: Form(
                      key: droneFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            Center(
                              child: Text('Preencha com os dados da entrega', style: textTheme.headline6?.copyWith(fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(height: 36),
                            Text('De onde a entrega está saindo', style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400)),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: getTextFieldDecoration(context: context, enabled: true, label: 'Partida', isInvalid: false),
                              validator: (email) => email == null || email.isEmpty ? 'Campo obrigatório' : null,
                            ),
                            const SizedBox(height: 24),
                            Text('Para onde a entrega está indo', style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400)),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: getTextFieldDecoration(context: context, enabled: true, label: 'Chegada', isInvalid: false),
                              validator: (email) => email == null || email.isEmpty ? 'Campo obrigatório' : null,
                            ),
                            const SizedBox(height: 24),
                            Text('Conteúdo da entrega', style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400)),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: getTextFieldDecoration(context: context, enabled: true, label: 'Conteúdo', isInvalid: false),
                              validator: (email) => email == null || email.isEmpty ? 'Campo obrigatório' : null,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 48,
                              child: Obx(
                                () => AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: controller.isLoading.value
                                      ? const Center(child: CircularProgressIndicator())
                                      : SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.indigoA700)),
                                            child: const Text('Enviar'),
                                            onPressed: () {
                                              controller.enviar();
                                            },
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
