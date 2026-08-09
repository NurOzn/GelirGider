import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/login/login_controller.dart';
import 'package:get/state_manager.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await controller.googleIleGirisYap();
          },
          child: Text("Google ile giriş yap"),
        ),
      ),
    );
  }
}



