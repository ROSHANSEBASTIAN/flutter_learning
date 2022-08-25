import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import '../model/numbers_api_response_model/numbers_api_response_model.dart';

class NumbersAPIScreen extends StatefulWidget {
  const NumbersAPIScreen({Key? key}) : super(key: key);

  @override
  State<NumbersAPIScreen> createState() => _NumbersAPIScreenState();
}

class _NumbersAPIScreenState extends State<NumbersAPIScreen> {
  final _numberController = TextEditingController();
  String numberDescription = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Numbers API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter your number",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () => searchHandler(_numberController.text),
              icon: const Icon(Icons.search),
              label: const Text("Search"),
            ),
            Text(numberDescription),
          ],
        ),
      ),
    );
  }

  Future<void> searchHandler(String number) async {
    if (number.isEmpty) {
      return;
    }
    final _response =
        await http.get(Uri.parse("http://numbersapi.com/${number}?json"));
    final _jsonConvertedMapResponse =
        jsonDecode(_response.body) as Map<String, dynamic>;
    print("3");
    print(_jsonConvertedMapResponse);
    final _responseObject =
        NumbersApiResponseModel.fromJson(_jsonConvertedMapResponse);
    print("4");
    setState(() {
      numberDescription =
          _responseObject.text ?? "No response found for this number";
    });
  }
}
