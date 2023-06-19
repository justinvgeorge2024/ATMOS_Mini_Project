import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:csv/csv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

List<List<String>> itemList = [];

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  Stream<QuerySnapshot> streamQuery = db.collection("Users").snapshots();
  @override
  void initState() {
    super.initState();
    itemList = [
      <String>["name", "email", "admno"]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("to export"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: streamQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: Column(children: <Widget>[
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data!.docs[index];
                    itemList.add(<String>[
                      doc.get("name"),
                      doc.get('email'),
                      doc.get('admno')
                    ]);
                    return null;
                  },
                ))
              ]),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.file_download),
          onPressed: () => {
                genCsv(),
              }),
    );
  }
}

genCsv() async {
  print("gen csv");
  String csvData = const ListToCsvConverter().convert((itemList));
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MM-dd-yyyy-HH-mm-ss').format(now);
  Directory generalDownloadDir = Directory("storage/emulated.0/Download");
  final File file =
      await (File('${generalDownloadDir.path}/item_expot_$formattedDate.csv')
          .create());
  await file.writeAsString(csvData);
}
