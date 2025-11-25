import 'package:flutter/material.dart';

class Favorie extends StatelessWidget {
  const Favorie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorie",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text("Explorez par genre", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: Center(),
    );
  }
}
