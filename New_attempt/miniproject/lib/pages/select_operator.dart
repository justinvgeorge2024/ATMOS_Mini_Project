import 'package:flutter/material.dart';
import 'package:miniproject/pages/student_login.dart';
import 'package:miniproject/pages/students_home.dart';
import 'package:miniproject/pages/teacher_login.dart';
import 'package:miniproject/pages/teachers_home.dart';
import 'package:miniproject/pref/pref.dart';

class SelectOp extends StatelessWidget {
  const SelectOp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 238, 238, 238),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "ATMOS",
          style: TextStyle(
            fontSize: 50,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (PrefManager.getIsLoggedIn() == false) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const StudentsHome()));
                      } else {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const StudentLogin()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("STUDENT"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (PrefManager.getIsLoggedInT() != true) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const TeachersHome()));
                        } else {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const TeacherLogin()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("TEACHER")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
