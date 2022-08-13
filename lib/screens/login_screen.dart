import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/screen_name.dart';
import '../utils/common_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        color: Colors.amber,
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email ID",
                  labelText: "Email ID",
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0)),
                  border: OutlineInputBorder(
                    gapPadding: 1.0,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value is empty";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _pwdController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0)),
                  border: OutlineInputBorder(
                    gapPadding: 1.0,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value is empty";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => _submitButtonHandler(context),
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  // callbacks
  Future<void> _submitButtonHandler(BuildContext context) async {
    final _email = _emailController.text;
    final _pwd = _pwdController.text;
    printToLog("Email " + _email);
    printToLog("Password " + _pwd);

    if (_formKey.currentState!.validate() && _email == _pwd) {
      // Go To Home Screen after storing email id in shared preference

      print("Called 1");
      var x = await saveUsernameToShared(_email);
      Navigator.of(context).pushReplacementNamed(routeType1HomeScreen);
    } else {
      // Error case.
      const _errMessage = "Email ID and Pwd are not the same";
      // Show snackbar
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text(_errMessage),
      //   ),
      // );

      // Show MaterialBaner
      ScaffoldMessenger.of(context)
        ..removeCurrentMaterialBanner()
        ..showMaterialBanner(
          MaterialBanner(
            content: const Text(_errMessage),
            actions: [
              ElevatedButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                child: const Text("Ok"),
              ),
            ],
          ),
        );
    }
  }

  Future<void> saveUsernameToShared(String value) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.setString("username", value);
  }
}
