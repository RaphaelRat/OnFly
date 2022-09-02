import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/model/user/user.dart';
import '../../core/core.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final loginFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.whiteSmoke,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: AppColors.mainColor,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            color: AppColors.mainColor,
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: AppColors.whiteSmoke,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowIndicator();
                          return false;
                        },
                        child: SingleChildScrollView(
                          child: Form(
                            key: loginFormKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 24),
                                Text('Faça seu login',
                                    style: textTheme.headline6?.copyWith(
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 36),
                                TextFormField(
                                  decoration: getTextFieldDecoration(
                                      context: context,
                                      enabled: true,
                                      label: 'Email',
                                      isInvalid: false),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (email) =>
                                      email == null || email.isEmpty
                                          ? 'Campo obrigatório'
                                          : null,
                                  initialValue: kReleaseMode
                                      ? null
                                      : users.elementAt(0).email,
                                  onSaved: controller.onEmailFormChanged,
                                ),
                                const SizedBox(height: 16),
                                Obx(
                                  () => TextFormField(
                                    obscureText:
                                        controller.obscurePassword.value,
                                    decoration: getTextFieldDecoration(
                                            context: context,
                                            enabled: true,
                                            label: 'Senha',
                                            isInvalid: false)
                                        .copyWith(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            controller.obscurePassword.value
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                        onPressed: () => controller
                                                .obscurePassword.value =
                                            !controller.obscurePassword.value,
                                      ),
                                    ),
                                    validator: (password) =>
                                        password == null || password.isEmpty
                                            ? 'Campo obrigatório'
                                            : null,
                                    initialValue: kReleaseMode
                                        ? null
                                        : users.elementAt(0).senha,
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
                                            style: textTheme.caption?.copyWith(
                                                color: AppColors.errorColor),
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  height: 48,
                                  child: Obx(
                                    () => AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: controller.isLoading.value
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                  color: AppColors.mainColor))
                                          : SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .mainColor)),
                                                child: const Text(
                                                    'Iniciar sessão'),
                                                onPressed: () =>
                                                    onConnectPressed(
                                                        loginFormKey),
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextButton(
                                  child: Text('Esqueceu sua senha?',
                                      style: textTheme.bodyMedium?.copyWith(
                                          color: AppColors.mainColor)),
                                  onPressed: () => showGetSnackbar(
                                      text: 'Em desenvolvimento'),
                                ),
                                const SizedBox(height: 16),
                                RichText(
                                  text: TextSpan(
                                    style: textTheme.caption,
                                    children: [
                                      const TextSpan(
                                          text: 'Não possui uma conta?  '),
                                      WidgetSpan(
                                        child: GestureDetector(
                                          child: const Text('Cadastre-se',
                                              style: TextStyle(
                                                  color: AppColors.mainColor)),
                                          onTap: () => showGetSnackbar(
                                              text: 'Em desenvolvimento'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
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
