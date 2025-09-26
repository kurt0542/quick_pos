import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pos/presentation/screens/manager/addItems/mobile_add_menu_item_screen.dart';
import 'package:quick_pos/presentation/screens/manager/settings/mobile_account_creation_dialogue.dart';

import 'mobile_product_deletion.dart';

class ManagerMobileSettingsScreen extends StatelessWidget {
  const ManagerMobileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Manager Settings",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.grey[50],
          ),
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
            title: Text(
              "Jane Manager",
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            subtitle: Text("Manager", style: GoogleFonts.poppins(fontSize: 13)),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.lock),
            title: Text("Change Password", style: GoogleFonts.poppins()),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.add_box),
            title: Text("Add New Product", style: GoogleFonts.poppins()),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MobileAddMenuItemScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete),
            title: Text("Delete Product", style: GoogleFonts.poppins()),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MobileProductDeletion(),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.person_add),
            title: Text("Create Cashier Account", style: GoogleFonts.poppins()),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              MobileAccountCreationDialogue(context);
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
