import 'package:get/get.dart';

import '../../data/data.dart';
import '../map/map_page.dart';

class DroneController extends GetxController {
  late Rx<Drone> drone;
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
    Get.toNamed(MapPage.route, arguments: drone);
    drone.value.estaNoRadar = true;
    drone.refresh();
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

  void onPesoFormChanged(String? novoPeso) {
    entregaForm.value = entregaForm.value.copyWith(peso: novoPeso);
  }
}
