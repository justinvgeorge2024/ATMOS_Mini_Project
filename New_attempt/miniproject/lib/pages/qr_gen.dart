import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  String qrData = "";
  final TextEditingController _editingController =
      TextEditingController(text: '');
  // ignore: prefer_typing_uninitialized_variables
  late var data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "QR-Generator",
            style: TextStyle(
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                decoration:
                    const InputDecoration(contentPadding: EdgeInsets.all(10)),
                controller: _editingController,
              ),
              ElevatedButton(
                onPressed: () {
                  setState() {
                    data = _editingController.text;
                  }
                },
                child: const Text("Generate QR"),
              ),
              const Center(
                  // child: SizedBox(child: QrImage('$data'), width: 400, height: 400),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
