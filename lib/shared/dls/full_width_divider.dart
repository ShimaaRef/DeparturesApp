import 'package:flutter/material.dart';

class FullWidthDivider extends StatelessWidget {
  const FullWidthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      height: 1,
      color: Color(0xFF191F25), // Semantic Colors/ Border/Primary
    );
  }
}
