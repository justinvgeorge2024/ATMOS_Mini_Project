import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/pages/students_home.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  QrGenerator({super.key});
  final cityRef = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.email)
      .withConverter<City>(
        fromFirestore: (snapshots, _) => City.fromJson(snapshots.data()!),
        toFirestore: (city, _) => city.toJson(),
      );

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  City? city;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pullFromFirebase();
  }

  _pullFromFirebase() async {
    var snap = await widget.cityRef.get();
    if (snap.data() == null) {
      return;
    }
    setState(() {
      city = City.fromJson(snap.data()!.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 129, 34, 146),
          title: const Text(
            "data",
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StudentsHome(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: city != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        city!.name,
                        style: const TextStyle(fontSize: 20),
                      ),
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
                        data: "${city?.admno} , ${city?.name}",
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ],
                  ),
                ],
              )
            : const CircularProgressIndicator());
  }
}

@immutable
class City {
  const City({
    required this.admno,
    required this.email1,
    required this.name,
  });

  City.fromJson(Map<String, Object?> json)
      : this(
          admno: json['admno']! as String,
          email1: json['email']! as String,
          name: json['name']! as String,
        );

  final String name;
  final String email1;
  final String admno;

  Map<String, Object?> toJson() {
    return {
      'admno': admno,
      'email': email1,
      'name': name,
    };
  }

}
