import 'package:flutter/material.dart';

import '../../db/model/data_model.dart';
import '../../db/functions/db_functions.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentNotifier,
        builder: (context, List<StudentModel> studentList, child) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final data = studentList[index];

                return ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.age),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 5);
              },
              itemCount: studentList.length,
            ),
          );
        });
  }
}
