import 'package:flutter/material.dart';
import 'package:miniproject/pages/select_operator.dart';
import 'package:miniproject/pages/students_home.dart';
import 'package:miniproject/pages/students_regs.dart';

class StudentLogin extends StatelessWidget {
  const StudentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.redAccent,
            title: const Text(
              "STUDENT LOGIN",
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
                      builder: (context) => const SelectOp()));
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const StudentsHome()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("Login"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const StudentsRegs()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
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
