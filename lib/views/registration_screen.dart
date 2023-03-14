import 'package:flutter/material.dart';
import 'package:seenit/views/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _usernameEditingController = TextEditingController(text: "name");
  final _passwordEditingController = TextEditingController(text: "password");
  final _rePasswordEditingController =
      TextEditingController(text: "re-enter password");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
    _rePasswordEditingController.dispose();
    super.dispose();
  }

  printUsername() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 79, 232, 255),
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
                const Text("SignUp Screen"),
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
                  controller: _usernameEditingController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      iconColor: const Color.fromARGB(255, 255, 255, 255),
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
                  controller: _passwordEditingController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: Divider.createBorderSide(context,
                            color: Colors.white, width: 500)),
                  ),
                  // decoration: const InputDecoration(hintText: "Username"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _rePasswordEditingController,
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
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text("Register")),
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
