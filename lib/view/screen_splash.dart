import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:student_management_provider/provider/splash_screen_provider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: false).goToLogin(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          child: Lottie.asset(
            'assets/students running.json',
            width: 130,
            height: 130,
          ),
        ),
      ),
    );
  }
}