import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pos/data/service/auth_service.dart';

import '../../widgets/form_field.dart';
import '../cashier/cashier_mobile_navigation.dart';
import '../manager/manager_mobile_navigation.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    try {
     final result = await AuthService().login(username, password);
      String role = result['role'];
      if(role == 'CASHIER'){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CashierMobileNavigation()),
        );
      }
      if(role == 'MANAGER'){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ManagerMobileNavigation()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + keyboardHeight),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Image.asset(
                        'assets/images/login_logo_500x500.png',
                        fit: BoxFit.contain,
                        height: 120,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'quickPOS',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                      const SizedBox(height: 40),
                      FormTextField(
                        isPasswordField: false,
                        fieldLabelText: 'Username',
                        controller: usernameController,
                      ),
                      const SizedBox(height: 15),
                      FormTextField(
                        isPasswordField: true,
                        fieldLabelText: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        elevation: 4,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: _login,
                          child: const Padding(
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
                      const Spacer(),
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
