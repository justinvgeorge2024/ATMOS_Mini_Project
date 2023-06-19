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
 String Qd  = "${city?.genre}";
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
    required this.genre,
    required this.likes,
    required this.poster,
  });

  City.fromJson(Map<String, Object?> json)
      : this(
          genre: json['genre']! as String,
          likes: json['likes']! as int,
          poster: json['poster']! as String,
        );

  final String poster;
  final int likes;
   String genre="";

  Map<String, Object?> toJson() {
    return {
      'genre': genre,
      'likes': likes,
      'poster': poster,
    };
  }

  String rfgr() {
    return genre;
  }
}
