import 'package:get/get.dart';

import '../../data/model/drone/drone.dart';
import '../../data/model/entrega_form/entrega_form.dart';

class DroneController extends GetxController {
  late Drone drone;
  final isLoading = false.obs;
  final Rx<EntregaForm> entregaForm = EntregaForm().obs;

  @override
  void onInit() {
    drone = Get.arguments;

    super.onInit();
  }

  void enviar() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }

  void onPartidaFormChanged(String? novaPartida) {
    entregaForm.value = entregaForm.value.copyWith(partida: novaPartida);
  }

  void onChegadaFormChanged(String? novaChegada) {
    entregaForm.value = entregaForm.value.copyWith(chegada: novaChegada);
  }

  void onConteudoFormChanged(String? novoConteudo) {
    entregaForm.value = entregaForm.value.copyWith(conteudo: novoConteudo);
  }
}
