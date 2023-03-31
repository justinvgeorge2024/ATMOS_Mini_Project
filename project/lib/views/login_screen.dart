import 'package:flutter/material.dart';
import 'package:atmos/views/home_screen.dart';
import 'package:atmos/views/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameEditingController = TextEditingController(text: "name");
  final _passwordEditingController = TextEditingController(text: "password");
  var _color = Color.fromARGB(218, 0, 0, 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  printUsername() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                ),
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Name",
                      iconColor: Color.fromARGB(255, 0, 81, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: Divider.createBorderSide(context,
                              color: Colors.amber))),
                  // decoration: const InputDecoration(hintText: "Username"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordEditingController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: Divider.createBorderSide(context,
                              color: Color.fromARGB(255, 167, 21, 21),
                              width: 500))),
                  // decoration: const InputDecoration(hintText: "Username"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // setState(() {    // setState used to change the states in widgets.
                    //   _color = Colors.white; // here it is used to reflect the change in background color
                    // });
                    // print(_color);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  }, //printUsername,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style: TextStyle(color: Colors.amber),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationScreen()));
                        },
                        child: const Text("Register Now!")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
