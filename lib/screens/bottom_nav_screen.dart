import 'package:flutter/material.dart';
import 'package:sample_app_1/widgets/molecules/profile_bottom_nav.dart';
import 'package:sample_app_1/widgets/molecules/search_bottom_nav.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  final tabsList = [ProfileBottomNav(), SearchBottomNav()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabsList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
        onTap: (newIndex) => setState(() {
          _selectedIndex = newIndex;
        }),
      ),
    );
  }
}
