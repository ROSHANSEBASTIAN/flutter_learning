import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_1/screens/bottom_nav_screen.dart';

import './constants/screen_name.dart';
import './screens/home_screen.dart';
import './screens/type_1_home_screen.dart';
import './screens/spalsh_screen.dart';
import './screens/login_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: {
      routeSplashScreen: (context) => const SplashScreen(),
      routeLoginScreen: (context) => const LoginScreen(),
      routeType1HomeScreen: (context) => const Type1HomeScreen(),
      bottomNavScreen: (context) => const BottomNavScreen(),
    },
  ));
}

class MySampleApp extends StatelessWidget {
  const MySampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample App"),
      ),
      body: const Center(
        child: Text("This is a Sample App"),
      ),
    );
  }
}
