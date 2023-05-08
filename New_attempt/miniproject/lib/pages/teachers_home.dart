import 'package:flutter/material.dart';
import 'package:miniproject/pages/qr_gen.dart';
import 'package:miniproject/pages/teacher_login.dart';

class TeachersHome extends StatelessWidget {
  const TeachersHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.redAccent,
            title: const Text(
              "TEACHER HOME",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const TeacherLogin()));
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const QrGenerator()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Scan QR"),
                ),
              ],
            ),
          )),
    );
  }
}
