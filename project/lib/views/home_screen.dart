import 'dart:ffi';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:atmos/services/rest_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> products = ["Bed", "Sofa", "Chair"];
  List<String> productDetails = ["QueenSize", "King Size"];
  List<int> price = [1000, 2000, 3000];
  bool _isLoading = true;
  String url = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("homescreen")),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.all(2.0), children: [
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
          ),
          ListTile(
            title: Text("list 2"),
            subtitle: Text("Item 2"),
            tileColor: Colors.grey,
          ),
          ExpansionTile(
            title: Text("Expansion tile"),
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [Text("juice"), Text("beetlejuice")],
                  ),
                ),
              )
            ],
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
          Container(
              child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(products[index]),
                subtitle: Text(productDetails[index]),
                trailing: Text(price[index].toString()),
                leading: CircleAvatar(
                  child: Text(products[index][0]),
                ),
              );
            },
          ))
        ],
      )),
    );
  }
}
