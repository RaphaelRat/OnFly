import 'package:get/get.dart';

import '../../core/utils/snackbar.dart';
import '../../data/model/login_form/login_form.dart';
import '../../data/model/user/user_mock.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool incorrectCredentials = false.obs;
  final RxBool obscurePassword = true.obs;
  final Rx<LoginForm> loginForm = LoginForm().obs;

  final RxBool isLoadingForgot = false.obs;
  final RxBool incorrectEmail = false.obs;
  final RxBool emailExists = false.obs;

  Future<void> executeLogin() async {
    isLoading.value = true;

    final user = users.where((user) => user.email == loginForm.value.email && user.senha == loginForm.value.senha).toList();

    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    if (user.isEmpty) {
      incorrectCredentials.value = true;
      return;
    }

    showGetSnackbar(text: 'Voce logou!', duration: 2);
  }

  void onEmailFormChanged(String? novoEmail) {
    loginForm.value = loginForm.value.copyWith(email: novoEmail);
  }

  void onPasswordFormChanged(String? novaSenha) {
    loginForm.value = loginForm.value.copyWith(senha: novaSenha);
  }
}
