import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

import 'package:student_management_provider/constrains/colors.dart';
import 'package:student_management_provider/constrains/constants.dart';
import 'package:student_management_provider/provider/list_provider.dart';
import 'package:student_management_provider/view/add_student/add_students.dart';
import 'package:student_management_provider/view/student_details/student_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Tcolo.primarycolor1,
        title: !homeProvider.isSearching
            ? const Text('Student List', style: titletxt)
            : TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (query) {
                  homeProvider.filterStudents(query);
                },
                decoration: const InputDecoration(
                  hintText: 'Search student here',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              homeProvider.toggleSearch();
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: homeProvider.filteredStudents.isEmpty
          ? 
          // const Center(
          //     child: Text(
          //       'No students found.',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w600,
          //           letterSpacing: 4,
          //           wordSpacing: 5),
          //     ),
          //   )
          Center(
            child: SizedBox(
              width: 200,
              child: Lottie.asset('assets/no data found.json')),
          )
          : ListView.builder(
  padding: const EdgeInsets.all(8.0),
  itemCount: homeProvider.filteredStudents.length,
  itemBuilder: (context, index) {
    final student = homeProvider.filteredStudents[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDetailspage(student: student),
          ),
        ).then((value) => homeProvider.refreshStudentList());
      },
      child: Card(
        child: ListTile(
          
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: FileImage(File(student.profilePicturePath)),
          ),
          title: Text(
            student.name,
            style:const TextStyle(
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold,
            ),
            
          ),
           subtitle:Text(student.schoolname),
               trailing: Text('age:${student.age.toString()}'),
        ),
      ),
    );
  },
),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddStudentScreen()))
              .then((value) => homeProvider.refreshStudentList());
        },
        backgroundColor:Tcolo.secondarycolor1,
        child: const Icon(Icons.add),
      ),
    );
  }
}
 