import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/pages/teacher_login.dart';

import '../services/auth_services.dart';

class TeachersRegs extends StatefulWidget {
  const TeachersRegs({super.key});

  @override
  State<TeachersRegs> createState() => _TeachersRegsState();
}

class _TeachersRegsState extends State<TeachersRegs> {
  bool _isVisibility=false;
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  bool isloading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future _registerUser() async {
    try {
      setState(() {
        isloading = true;
      });
      String email = _usernameController.text.trim();
      String password = _passwordController.text.trim();
      Future<String> res =
          AuthServices.singup(email: email, password: password);
      setState(() {
        isloading = false;
      });

      if (res != "success") {
        print(res);
        return;
      }
      Get.to(const TeacherLogin());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color.fromARGB(255, 129, 34, 146),
            title: const Text(
              "TEACHER REGISTRATION",
              style: TextStyle(
                fontSize: 23,
                //fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const TeacherLogin()));
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        hintText: "E-Mail",
                        prefixIcon: const Icon(
                          Icons.mail,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: !_isVisibility,
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        hintText: "Password",
                         prefixIcon:const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _isVisibility=!_isVisibility;
                          });
                        },
                        icon:_isVisibility ? Icon(Icons.visibility,color: Colors.black,):Icon(Icons.visibility_off,color: Colors.grey,),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _registerUser();
                        // ignore: unnecessary_null_comparison
                        if (_registerUser() == null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const TeachersRegs()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 129, 34, 146),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: isloading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Center(
                              child: Text("Register"),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}