import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/service/auth_service.dart';
import '../../widgets/form_field.dart';
import '../cashier/cashier_mobile_navigation.dart';

class DesktopLoginScreen extends StatefulWidget {
  const DesktopLoginScreen({super.key});

  @override
  State<DesktopLoginScreen> createState() => _DesktopLoginScreenState();
}

class _DesktopLoginScreenState extends State<DesktopLoginScreen> {

  bool _hovering = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  _login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    try {
      await AuthService().login(username, password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CashierMobileNavigation()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  'quickPOS',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                Text(
                  'from tap to transaction in seconds.',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 400,
                  width: 400,
                  margin: EdgeInsets.only(right: 120),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(15),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 20),
                        FormTextField(
                          isPasswordField: false,
                          fieldLabelText: 'Username',
                          controller: usernameController,
                        ),
                        SizedBox(height: 18),
                        FormTextField(
                          isPasswordField: true,
                          fieldLabelText: 'Password',
                          controller: passwordController,
                        ),
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MouseRegion(
                            onEnter: (_) =>
                                setState(() => _hovering = true),
                            onExit: (_) =>
                                setState(() => _hovering = false),
                            child: GestureDetector(
                              onTap: () {
                                print("Forgot password tapped");
                              },
                              child: AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 200),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: _hovering
                                      ? Colors.blue
                                      : Colors.black87,
                                  decoration: _hovering
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                ),
                                child: Text("forgot your password?"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 14,
                              ),
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
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "v1.0.0",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/login_logo_500x500.png',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
