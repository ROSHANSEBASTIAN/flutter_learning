import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/data_model.dart';

ValueNotifier<List<StudentModel>> studentNotifier = ValueNotifier([]);

Future<void> addStudentToList(StudentModel value) async {
  final _studentDB = await Hive.openBox<StudentModel>("student_db");
  value.id = await _studentDB.add(value);
  studentNotifier.value.add(value);
  studentNotifier.notifyListeners();
}

Future<void> getStudentsList() async {
  final _studentDB = await Hive.openBox<StudentModel>("student_db");
  studentNotifier.value.clear();
  studentNotifier.value.addAll(_studentDB.values);
  print("Number of students " + _studentDB.values.length.toString());
  studentNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final _studentDB = await Hive.openBox<StudentModel>("student_db");
  _studentDB.delete(id);
  studentNotifier.value.removeWhere((element) => element.id == id);
  studentNotifier.notifyListeners();
}

Future<void> initializeHiveDB() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
}
