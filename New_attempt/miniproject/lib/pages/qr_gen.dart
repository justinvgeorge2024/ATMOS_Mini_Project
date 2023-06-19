import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'student_login.dart';

class QrGenerator extends StatefulWidget {
   QrGenerator({super.key});
  
  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

const Q1 = "xfgdsdftghdfgh";

User? user = FirebaseAuth.instance.currentUser;
final cityRef = FirebaseFirestore.instance
    .collection('Users')
    .doc(user?.email)
    .withConverter<City>(
      fromFirestore: (snapshots, _) => City.fromJson(snapshots.data()!),
      toFirestore: (city, _) => city.toJson(),
    );
 City? city;
 String Qd  = "${city?.admno}";
class _QrGeneratorState extends State<QrGenerator> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 34, 146),
        title: const Text(
          "data",
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
                data: Qd ,
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

@immutable
class City {
   City({
    required this.admno,
    required this.email1,
    required this.name,
  });

  City.fromJson(Map<String, Object?> json)
      : this(
          admno: json['admno']! as String,
          email1: json['email']! as int,
          name: json['name']! as String,
        );

  final String name;
  final int email1;
  final String admno;

  Map<String, Object?> toJson() {
    return {
      'admno': admno,
      'email': email1,
      'name': name,
    };
  }

  String rfgr() {
    return admno;
  }
}
