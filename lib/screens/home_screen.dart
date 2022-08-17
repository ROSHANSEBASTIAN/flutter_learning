import 'package:flutter/material.dart';

import '../constants/home_page_item_key.dart';
import '../widgets/atoms/home_screen_item.dart';
import '../model/home_page_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<HomePageItem> homePageItems = [
    HomePageItem(
        "Shared Preference", "Shared Preference", HomePageItemKey.sharedPref),
    HomePageItem(
        "Bottom Tab", "Bottom Navigation", HomePageItemKey.bottomNavigation),
    HomePageItem("Hive DB", "Hive DB", HomePageItemKey.hiveDB),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: homePageItems.length,
          itemBuilder: (context, index) =>
              HomeScreenItem(homePageItem: homePageItems[index]),
        ),
      ),
    );
  }
}
