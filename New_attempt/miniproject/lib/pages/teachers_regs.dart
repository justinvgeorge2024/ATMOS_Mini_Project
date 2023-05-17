import 'package:flutter/material.dart';
import 'package:miniproject/pages/teacher_login.dart';

class TeachersRegs extends StatefulWidget {
  const TeachersRegs({super.key});

  @override
  State<TeachersRegs> createState() => _TeachersRegsState();
}

class _TeachersRegsState extends State<TeachersRegs> {
  bool _isVisibility=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.blueGrey[700],
            title: const Text(
              "TEACHER REGISTRATION",
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-Mail',
                        prefixIcon: Icon(
                          Icons.mail,
                        ),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(8), // Added this
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon:Icon(
                          Icons.lock,
                        ),
                        
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(8), // Added this
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Re-Enter Passworrd',
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(8), // Added this
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const TeacherLogin()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text("Register")),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
