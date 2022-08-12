import 'package:flutter/material.dart';

class Type1HomeScreen extends StatelessWidget {
  const Type1HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Type 1 Home"),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
