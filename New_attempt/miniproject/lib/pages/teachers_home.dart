import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/pages/qr_scan.dart';
import 'package:miniproject/pages/select_operator.dart';
import 'package:miniproject/pages/teacher_login.dart';

class TeachersHome extends StatefulWidget {
  const TeachersHome({super.key});

  @override
  State<TeachersHome> createState() => _TeachersHomeState();
}

class _TeachersHomeState extends State<TeachersHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.purple[700],
            title: const Text(
              "TEACHER HOME",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TeacherLogin()));
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const QrScan()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[700],
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
