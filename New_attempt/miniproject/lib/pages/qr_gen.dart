import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

getStudentData() async {
  var collection = FirebaseFirestore.instance.collection('Users');
  var docSnapshot = await collection.doc('123@gmail.com').get();
  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data()!;

    // You can then retrieve the value from the Map like this:
    return data['admno'].toString();
  } else {
    return "no snapshot";
  }
}

class _QrGeneratorState extends State<QrGenerator> {
  // var Q1 = "nope";
  final Q1 = getStudentData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 34, 146),
        title: const Text(
          "data_doc",
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Text(
              'name',
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.3,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 4.8,
              ),
              QrImageView(
                data: Q1,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
