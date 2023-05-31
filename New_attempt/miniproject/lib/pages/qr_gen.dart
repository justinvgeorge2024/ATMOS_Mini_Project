import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

const Q1 = "xfgdsdftghdfgh";

class _QrGeneratorState extends State<QrGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "data",
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: const [
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
