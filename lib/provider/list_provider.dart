import 'package:flutter/material.dart';
import 'package:student_management_provider/database/data_base_helper.dart';
import 'package:student_management_provider/model/student_model.dart';

class HomeProvider extends ChangeNotifier {
  late DatabaseHelper databaseHelper;
  List<Student> students = [];
  List<Student> filteredStudents = [];
  bool isSearching = false;

  HomeProvider() {
    databaseHelper = DatabaseHelper();
    refreshStudentList();
  }

  Future<void> refreshStudentList() async {
    final studentList = await databaseHelper.getStudent();
    students = studentList;
    filteredStudents = studentList;
    notifyListeners();
  }

  void toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      filteredStudents = students;
    }
    notifyListeners();
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      filteredStudents = students;
    } else {
      filteredStudents = students
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
