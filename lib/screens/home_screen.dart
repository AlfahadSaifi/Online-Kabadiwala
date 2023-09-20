import 'package:flutter/material.dart';
import 'package:scrap_saathi/screens/home_page.dart';
import 'package:scrap_saathi/screens/pickup.dart';
import 'package:scrap_saathi/screens/prices.dart';
import 'package:scrap_saathi/screens/user.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;
  const HomeScreen({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    PricesPage(),
    Pickup(),
    UserPage(),
  ];

  void navigateToTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
        elevation: 100,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Prices',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.car_rental,
              color: Colors.white,
            ),
            label: 'Pickup',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'User',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: navigateToTab,
      ),
    );
  }
}
