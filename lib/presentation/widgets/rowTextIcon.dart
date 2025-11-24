import 'package:flutter/material.dart';

class RowTextIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  const RowTextIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        IconButton(onPressed: () {}, icon: Icon(icon)),
      ],
    );
  }
}
