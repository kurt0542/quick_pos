import 'package:flutter/material.dart';

class ManagerMobileNavigation extends StatefulWidget {
  const ManagerMobileNavigation({super.key});

  @override
  State<ManagerMobileNavigation> createState() => _ManagerMobileNavigationState();
}

class _ManagerMobileNavigationState extends State<ManagerMobileNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("Orders Screen")),
    Center(child: Text("Pending Screen")),
    Center(child: Text("Transactions Screen")),
    Center(child: Text("Reports Screen")),
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
            label: "Receipts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Reports",
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
