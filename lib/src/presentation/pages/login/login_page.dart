import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import '../../widgets/widgets.dart';
import 'login_controller.dart';
import 'widgets/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(authDomain: AuthDomain()),
      builder: (_) => _LoginPage(),
    );
  }
}

class _LoginPage extends GetView<LoginController> {
  const _LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Activities',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36.0,
                  color: Palette.accent,
                ),
              ),
              const SizedBox(height: 36.0),
              Button(
                onTap: controller.login,
                iconData: AppIcons.google,
                label: 'login with google',
              ),
              const SizedBox(height: 18.0),
              Button(
                iconData: AppIcons.apple,
                onTap: controller.loginAnonymously,
                label: 'login anonymously',
              )
            ],
          ),
        ),
      ),
    );
  }
}
