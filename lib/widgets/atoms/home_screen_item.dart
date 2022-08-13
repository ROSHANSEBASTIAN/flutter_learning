import 'package:flutter/material.dart';

import '../../constants/screen_name.dart';
import '../../constants/home_page_item_key.dart';
import '../../model/home_page_item.dart';

class HomeScreenItem extends StatelessWidget {
  final HomePageItem homePageItem;

  const HomeScreenItem({Key? key, required this.homePageItem})
      : super(key: key);

  // callbacks
  void _onHomeItemClicked(BuildContext context) {
    if (homePageItem.id == HomePageItemKey.sharedPref) {
      Navigator.of(context).pushNamed(routeSplashScreen);
    } else if (homePageItem.id == HomePageItemKey.bottomNavigation) {
      Navigator.of(context).pushNamed(bottomNavScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(homePageItem.title),
        ),
        onTap: () => _onHomeItemClicked(context),
      ),
      elevation: 5,
    );
  }
}
