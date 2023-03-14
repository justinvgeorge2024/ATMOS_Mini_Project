import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seenit/views/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 79, 232, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.jpg",
                ),
                Text("SignUp Screen"),
                const SizedBox(height: 40),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //     border: Border.all(
                //       color: Colors.blue,
                //       width: 12,
                //       style: BorderStyle.solid,
                //     ),
                //     borderRadius: BorderRadius.circular(13),
                //   ),
                //   child: const Text(
                //     "Login Screen",
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 30,
                //         fontStyle: FontStyle.italic),
                //   ),
                // ),
                TextFormField(
                  // controller: _usernameEditingController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      iconColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: Divider.createBorderSide(context,
                              color: Colors.white))),
                  // decoration: const InputDecoration(hintText: "Username"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: _passwordEditingController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: Divider.createBorderSide(context,
                              color: Colors.white, width: 500))),
                  // decoration: const InputDecoration(hintText: "Username"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: _passwordEditingController,
                  decoration: InputDecoration(
                      hintText: "Re Enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: Divider.createBorderSide(context,
                              color: Colors.white, width: 500))),
                  // decoration: const InputDecoration(hintText: "Username"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text("Register")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: SafeArea(child: Text("SignUp Screen")),
  //   );
  // }
}
