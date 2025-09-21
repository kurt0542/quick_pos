import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CashierMobileSettingsScreen extends StatelessWidget {
  const CashierMobileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.grey[50]),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text("John Doe", style: GoogleFonts.poppins(fontSize: 16)),
            subtitle: Text("Cashier", style: GoogleFonts.poppins(fontSize: 13)),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: Text("Change Password", style: GoogleFonts.poppins()),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.info),
            title: Text("App Version", style: GoogleFonts.poppins()),
            subtitle: Text("v1.0.0", style: GoogleFonts.poppins(fontSize: 13)),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(
              "Logout",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
