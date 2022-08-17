import 'package:flutter/material.dart';

import '../../db/model/data_model.dart';
import '../../db/functions/db_functions.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({Key? key}) : super(key: key);

  // controllers
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Name",
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Age",
              labelText: "Age",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            onPressed: () => addStudent(),
            icon: const Icon(Icons.add),
            label: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // callbacks
  void addStudent() {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();

    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    print("Name is ${_name} and age is ${_age}");
    final _studentModel = StudentModel(name: _name, age: _age);
    addStudentToList(_studentModel);
  }
}
