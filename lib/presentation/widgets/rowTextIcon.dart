import 'package:flutter/material.dart';

class RowTextIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  const RowTextIcon({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed:
              onTap ??
              () {
                print('Voir plus: $text');
              },
          icon: Icon(icon, size: 20),
        ),
      ],
    );
  }
}
