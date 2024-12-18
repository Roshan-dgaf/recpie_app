import 'package:flutter/material.dart';
import 'package:recpie_app/Screen/cart_screen.dart';
import 'package:recpie_app/Screen/home_screen.dart';
import 'package:recpie_app/Screen/profile_screen.dart';
import 'package:recpie_app/app_utils.dart';
import 'package:recpie_app/bottom_navigation.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // This will keep track of the selected tab

  // List of screens corresponding to each bottom navigation item
  final List<Widget> lstBottomScreen = [
    // Add your screens here
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
    const AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        centerTitle: true,
        backgroundColor: colorPrimary,
      ),
      body: lstBottomScreen[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorPrimary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex, // Update the selected tab
        onTap: _onItemTapped, // Handle tab changes
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album_outlined),
            label: "About",
          ),
        ],
      ),
    );
  }
}
