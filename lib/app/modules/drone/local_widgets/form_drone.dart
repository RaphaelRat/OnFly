import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/form_field_input_decoration.dart';
import '../drone_controller.dart';

Widget formDrone({required BuildContext context, required GlobalKey<FormState> droneFormKey}) {
  final controller = Get.find<DroneController>();
  final textTheme = Theme.of(context).textTheme;

  return Form(
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
              validator: (peso) => pesoValidator(peso, controller: controller),
              onSaved: controller.onPesoFormChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: kDebugMode ? '1' : null,
              keyboardType: TextInputType.number),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator(color: AppColors.indigoA700))
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.indigoA700)),
                        child: const Text('Enviar'),
                        onPressed: () => onEnviarPressed(droneFormKey: droneFormKey, controller: controller),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    ),
  );
}

void onEnviarPressed({required GlobalKey<FormState> droneFormKey, required DroneController controller}) {
  droneFormKey.currentState?.save();

  final isValid = droneFormKey.currentState?.validate();
  if (isValid != null && isValid) {
    controller.enviar();
  }
}

String? pesoValidator(String? peso, {required DroneController controller}) {
  if (peso != null && peso.isNotEmpty) {
    try {
      if (double.parse(peso) > controller.drone.value.cargaMaxima) return 'Peso excedido';
    } catch (e) {
      return 'Dado inválido (use ponto ao invés de vírgula)';
    }
  }

  return peso == null || peso.isEmpty ? 'Campo obrigatório' : null;
}
