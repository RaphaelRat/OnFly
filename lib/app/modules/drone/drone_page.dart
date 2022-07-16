import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/form_field_input_decoration.dart';
import '../../core/utils/snackbar.dart';
import '../home/local_widgets/drone_card.dart';

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
      child: Scaffold(
        backgroundColor: AppColors.indigoA700,
        appBar: AppBar(
          title: Text(
            controller.drone.value.modelo,
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
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    droneCard(controller.drone, isDronePage: true),
                    const SizedBox(height: 24),
                    const Divider(thickness: 1, height: 0),
                    Expanded(
                      child: Container(
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
                                  validator: (partida) => partida == null || partida.isEmpty ? 'Campo obrigatório' : null,
                                  onSaved: controller.onPartidaFormChanged,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  initialValue: kDebugMode ? 'Partida' : null,
                                ),
                                const SizedBox(height: 24),
                                Text('Para onde a entrega está indo', style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400)),
                                const SizedBox(height: 8),
                                TextFormField(
                                  decoration: getTextFieldDecoration(context: context, enabled: true, label: 'Chegada', isInvalid: false),
                                  validator: (chegada) => chegada == null || chegada.isEmpty ? 'Campo obrigatório' : null,
                                  onSaved: controller.onChegadaFormChanged,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  initialValue: kDebugMode ? 'Chegada' : null,
                                ),
                                const SizedBox(height: 24),
                                Text('Conteúdo da entrega', style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400)),
                                const SizedBox(height: 8),
                                TextFormField(
                                  decoration: getTextFieldDecoration(context: context, enabled: true, label: 'Conteúdo', isInvalid: false),
                                  validator: (conteudo) => conteudo == null || conteudo.isEmpty ? 'Campo obrigatório' : null,
                                  onSaved: controller.onChegadaFormChanged,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  initialValue: kDebugMode ? 'Conteúdo' : null,
                                ),
                                const SizedBox(height: 24),
                                Text('Peso do conteúdo', style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400)),
                                const SizedBox(height: 8),
                                TextFormField(
                                    decoration: getTextFieldDecoration(context: context, enabled: true, label: 'Peso', isInvalid: false),
                                    validator: pesoValidator,
                                    onSaved: controller.onPesoFormChanged,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    initialValue: kDebugMode ? '1' : null,
                                    keyboardType: TextInputType.number),
                                const SizedBox(height: 24),
                                SizedBox(
                                  height: 48,
                                  child: Obx(
                                    () => AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 200),
                                      child: controller.isLoading.value
                                          ? const Center(child: CircularProgressIndicator(color: AppColors.indigoA700))
                                          : SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.indigoA700)),
                                                child: const Text('Enviar'),
                                                onPressed: () => onEnviarPressed(droneFormKey),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onEnviarPressed(GlobalKey<FormState> droneFormKey) {
    droneFormKey.currentState?.save();

    final isValid = droneFormKey.currentState?.validate();
    if (isValid != null && isValid) {
      controller.enviar();
    }
  }

  String? pesoValidator(String? peso) {
    if (peso != null && peso.isNotEmpty) {
      try {
        if (double.parse(peso) > controller.drone.value.cargaMaxima) return 'Peso excedido';
      } catch (e) {
        return 'Dado inválido (use ponto ao invés de vírgula)';
      }
    }

    return peso == null || peso.isEmpty ? 'Campo obrigatório' : null;
  }
}
