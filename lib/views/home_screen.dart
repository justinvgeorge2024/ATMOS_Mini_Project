import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:seenit/services/rest_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  String url = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("homescreen")),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text("Drawer-"),
          ),
          ListTile(
            title: Text("Hello"),
            subtitle: Text("Item 1"),
            leading: Text("leading"),
            trailing: Text("trailing"),
          )
        ]),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
            child: Text("call API"),
            onPressed: () async {
              await RestServices.getPosts().fold((left) {
                print("network failed");
              }, (right) {
                setState(() {
                  url = right;
                  _isLoading = false;
                });
              });
              // .fold((left) {
              //   print("network failed");
              // }, (right) {
              //   setState(() {

              //     url = right;
              //     _isLoading = false;
              //   }););

              // print("Called object");
            },
          ),
          _isLoading ? CircularProgressIndicator() : Image.network(url),
        ],
      )),
    );
  }
}
