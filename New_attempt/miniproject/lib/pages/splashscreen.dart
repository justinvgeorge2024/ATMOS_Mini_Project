import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miniproject/pages/select_operator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SelectOp(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          child: const Text(
            'ATMOS',
            style: TextStyle(
                color: Colors.white, fontSize: 70, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
