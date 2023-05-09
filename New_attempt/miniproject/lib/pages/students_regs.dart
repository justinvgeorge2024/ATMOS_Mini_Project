import 'package:flutter/material.dart';
import 'package:miniproject/pages/student_login.dart';

class StudentsRegs extends StatelessWidget {
  const StudentsRegs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.blueGrey[700],
            title: const Text(
              "STUDENT REGISTRATION",
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
                      builder: (context) => const StudentLogin()));
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
                        labelText: 'Passworrd',
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
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(8), // Added this
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentLogin()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text("Register")),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
