import 'package:flutter/material.dart';
import 'package:student_management_provider/view/home/screen_home.dart';


class SplashProvider extends ChangeNotifier {
  Future<void> goToLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => HomeScreen(),
      ),
    );
  }
}
