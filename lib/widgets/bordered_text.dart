import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  final String text;
  const BorderedText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0x7D424242),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 5,
          top: 5,
          left: 10,
          right: 10,
        ),
        child: Text(text),
      ),
    );
  }
}
