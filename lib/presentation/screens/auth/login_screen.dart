import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/screens/auth/desktop_login_screen.dart';
import 'package:quick_pos/presentation/screens/auth/mobile_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return MobileLoginScreen();
    } else {
      return DesktopLoginScreen();
    }
  }
}

