import 'package:flutter/material.dart';
import 'package:sample_app_1/widgets/molecules/student_list.dart';

import '../widgets/molecules/add_student_widget.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Home"),
      ),
      body: Column(
        children: [
          AddStudentWidget(),
          const StudentList(),
        ],
      ),
    );
  }
}
