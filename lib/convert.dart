import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key? key,
    required this.konvertHandler,
  }) : super(key: key);

  final Function konvertHandler;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                child: const Text(
                  "Konversi Suhu",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  konvertHandler();
                }))
      ],
    );
  }
}
