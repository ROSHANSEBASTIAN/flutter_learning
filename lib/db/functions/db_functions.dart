import 'package:flutter/foundation.dart';

import '../model/data_model.dart';

ValueNotifier<List<StudentModel>> studentNotifier = ValueNotifier([]);

void addStudentToList(StudentModel value) {
  print("addStudentToList called");
  studentNotifier.value.add(value);
  studentNotifier.notifyListeners();
}
