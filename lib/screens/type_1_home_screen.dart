import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Type1HomeScreen extends StatefulWidget {
  const Type1HomeScreen({Key? key}) : super(key: key);

  @override
  State<Type1HomeScreen> createState() => _Type1HomeScreenState();
}

class _Type1HomeScreenState extends State<Type1HomeScreen> {
  late String _userName;

  @override
  void initState() {
    getSetAppTitle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_userName),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }

  void getSetAppTitle() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = _sharedPrefs.getString("username")!;
    });
  }
}
