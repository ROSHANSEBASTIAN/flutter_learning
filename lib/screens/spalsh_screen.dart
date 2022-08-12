import 'dart:async';
import 'package:flutter/material.dart';

import '../constants/screen_name.dart';
import '../widgets/molecules/custom_appbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _count = 1;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State called");
    _timer = Timer(
        const Duration(
          milliseconds: 3000,
        ),
        () => Navigator.of(context).pushNamed(routeLoginScreen));
  }

  @override
  void didUpdateWidget(covariant SplashScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // TODO: implement didUpdateWidget
    print("didUpdateWidget called");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Dispose called");
    _timer.cancel();
  }

  void _onButtonPressed() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Splash Screen",
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
            child: Column(
          children: [
            CustomAppBar(title: _count.toString()),
            Image.asset(
              "assets/images/mahabali.png",
              height: 100.0,
              width: 100.0,
            ),
            ElevatedButton(
                onPressed: _onButtonPressed, child: const Text("Click me"))
          ],
        )),
      ),
    );
  }

  Future<void> goToLogin() async {}
}
