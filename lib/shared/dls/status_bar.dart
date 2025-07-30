import 'package:flutter/material.dart';

class CustomStatusBar extends StatelessWidget {
  const CustomStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 59, child: ColoredBox(color: Colors.white));
  }
}
