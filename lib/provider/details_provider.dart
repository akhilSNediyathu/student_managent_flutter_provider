import 'package:flutter/material.dart';
import 'package:student_management_provider/database/data_base_helper.dart';


class StudentDetailProvider extends ChangeNotifier {
  final DatabaseHelper db = DatabaseHelper();

  Future<void> deleteStudent(int studentId) async {
    await db.deleteStudent(studentId);
  }
}
