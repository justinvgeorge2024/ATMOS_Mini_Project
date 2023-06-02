import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/pages/select_operator.dart';
import 'package:miniproject/pages/teachers_regs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miniproject/pages/teachers_home.dart';
import 'package:miniproject/services/auth_services.dart';

class TeacherLogin extends StatefulWidget {
  const TeacherLogin({super.key});

  @override
  State<TeacherLogin> createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
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

  Future _loginUser() async {
    try {
      setState(() {
        isloading = true;
      });

      String email = _usernameController.text.trim();
      String password = _passwordController.text.trim();
      Future<String> res = AuthServices.login(email: email, password: password);
      setState(() {
        isloading = false;
      });

      if (res != "success") {
        print(res);
        return;
      }
      Get.to(const TeachersHome());
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
            backgroundColor:Colors.indigo[900],
            title: const Text(
              "TEACHER LOGIN",
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: Colors.blue, 
                        hintStyle: const TextStyle(color: Colors.white),
                        hintText: "E-Mail",
                        prefixIcon:const Icon(
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
                        icon:_isVisibility ? Icon(Icons.visibility,color: Colors.white,):Icon(Icons.visibility_off,color: Colors.white,),),
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
                        _loginUser();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => StreamBuilder<User?>(
                              stream: FirebaseAuth.instance.authStateChanges(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return const TeachersHome();
                                } else {
                                  return const TeacherLogin();
                                }
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: isloading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Center(
                              child: Text("Login"),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const TeachersRegs()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
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
