import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onfly/app/data/model/user/user_mock.dart';

import '../../core/utils/snackbar.dart';
import '../../core/theme/form_field_input_decoration.dart';
import '../../core/theme/app_colors.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final loginFormKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColors.indigoA700,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                flex: 2,
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: AppColors.whiteSmoke,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: SingleChildScrollView(
                      child: Form(
                        key: loginFormKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            Text('Faça seu login', style: textTheme.headline6?.copyWith(fontWeight: FontWeight.w500)),
                            const SizedBox(height: 36),
                            TextFormField(
                              decoration: getTextFieldDecoration(context: context, enabled: true, label: 'Email', isInvalid: false),
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) => email == null || email.isEmpty ? 'Campo obrigatório' : null,
                              initialValue: kReleaseMode ? null : users.elementAt(0).email,
                              onSaved: controller.onEmailFormChanged,
                            ),
                            const SizedBox(height: 16),
                            Obx(
                              () => TextFormField(
                                obscureText: controller.obscurePassword.value,
                                decoration: getTextFieldDecoration(context: context, enabled: true, label: 'Senha', isInvalid: false).copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(controller.obscurePassword.value ? Icons.visibility : Icons.visibility_off),
                                    onPressed: () => controller.obscurePassword.value = !controller.obscurePassword.value,
                                  ),
                                ),
                                validator: (password) => password == null || password.isEmpty ? 'Campo obrigatório' : null,
                                initialValue: kReleaseMode ? null : users.elementAt(0).senha,
                                onSaved: controller.onPasswordFormChanged,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Obx(
                              () => controller.incorrectCredentials.value
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Usuário ou senha incorretos',
                                        style: textTheme.caption?.copyWith(color: AppColors.red900),
                                      ),
                                    )
                                  : const SizedBox(),
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
                                            child: const Text('Conectar'),
                                            onPressed: () => onConnectPressed(loginFormKey),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            TextButton(
                              child: Text('Esqueceu sua senha?', style: textTheme.caption?.copyWith(color: AppColors.indigoA700)),
                              onPressed: () => showGetSnackbar(text: 'Em desenvolvimento'),
                            ),
                            const SizedBox(height: 24),
                            Text.rich(
                              TextSpan(
                                style: textTheme.caption,
                                children: [
                                  const TextSpan(text: 'Não é cadastrado?'),
                                  const WidgetSpan(child: SizedBox(width: 4)),
                                  WidgetSpan(
                                    child: InkWell(
                                      child: const Text('Crie uma conta', style: TextStyle(color: AppColors.indigoA700)),
                                      onTap: () => showGetSnackbar(text: 'Em desenvolvimento'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 56),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onConnectPressed(GlobalKey<FormState> loginFormKey) {
    controller.incorrectCredentials.value = false;
    loginFormKey.currentState?.save();

    final isValid = loginFormKey.currentState?.validate();
    if (isValid != null && isValid) {
      controller.executeLogin();
    }
  }
}
