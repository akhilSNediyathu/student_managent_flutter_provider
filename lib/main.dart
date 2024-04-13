import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/provider/add_page_provider.dart';
import 'package:student_management_provider/provider/details_provider.dart';
import 'package:student_management_provider/provider/edit_provider.dart';
import 'package:student_management_provider/provider/list_provider.dart';
import 'package:student_management_provider/provider/splash_screen_provider.dart';
import 'package:student_management_provider/view/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => StudentDetailProvider()),
        ChangeNotifierProvider(create: (_)=> SplashProvider()),
        ChangeNotifierProvider(create: (_)=>HomeProvider()),
        ChangeNotifierProvider(create: (_)=>AddStudentProvider()),
        ChangeNotifierProvider(create: (_)=>EditStudentProvider())

    ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Students',
      theme: ThemeData(
       primarySwatch: Colors.blue
       
       
      ),
      home:SplashScreen(),
    ),
    );
  }
}
