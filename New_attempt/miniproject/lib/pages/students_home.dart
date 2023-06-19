import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/pages/qr_gen.dart';
import 'package:miniproject/pages/select_operator.dart';
import 'package:miniproject/pages/student_login.dart';
import 'package:miniproject/pages/qr_scan.dart';

class StudentsHome extends StatefulWidget {
  const StudentsHome({super.key});

  @override
  State<StudentsHome> createState() => _StudentsHomeState();
}

class _StudentsHomeState extends State<StudentsHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgcolor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color.fromARGB(255, 129, 34, 146),
            title: const Text(
              "STUDENT HOME",
              style: TextStyle(
                fontSize: 23,
                //fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.logout_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SelectOp()));
                },
              )
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const StudentLogin()));
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>  QrGenerator()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 129, 34, 146),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Generate QR"),
                ),
              ],
            ),
          )),
    );
  }
}