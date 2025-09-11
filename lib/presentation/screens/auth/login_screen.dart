import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pos/presentation/widgets/form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return MobileLogin();
    } else {
      return DesktopLogin();
    }
  }
}

class MobileLogin extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  _login(){
    String username = usernameController.text;
    String password = passwordController.text;

  }
  MobileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/images/login_logo_500x500.png',
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'quickPOS',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 40),
            FormTextField(isPasswordField: false, fieldLabelText: 'username', controller: usernameController,),
            SizedBox(height: 15),
            FormTextField(isPasswordField: true, fieldLabelText: 'password', controller: passwordController,),
            SizedBox(height: 16),
            Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  _login();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
