import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './app/core/globals/global_bindings.dart';
import './app/modules/login/login_page.dart';
import './app/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: getAppPages(),
      initialRoute: LoginPage.route,
      initialBinding: GlobalBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}
