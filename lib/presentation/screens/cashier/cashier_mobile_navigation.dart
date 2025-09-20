import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/screens/cashier/orders/cashier_mobile_order_screen.dart';
import 'package:quick_pos/presentation/screens/cashier/pending/cashier_mobile_pending_screen.dart';
import 'package:quick_pos/presentation/screens/cashier/transactions/cashier_mobile_transaction_screen.dart';

class CashierMobileNavigation extends StatefulWidget {
  const CashierMobileNavigation({super.key});

  @override
  State<CashierMobileNavigation> createState() => _CashierMobileNavigationState();
}

class _CashierMobileNavigationState extends State<CashierMobileNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: CashierMobileOrderScreen()),
    Center(child: CashierMobilePendingScreen()),
    Center(child: CashierMobileTransactionScreen()),
    Center(child: Text("Settings Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_bottom),
            label: "Pending",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
