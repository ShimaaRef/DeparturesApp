import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, // Top left alignment
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24), // spacing-24
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24), // spacing-24
                const Text('🤔', style: TextStyle(fontSize: 48)),
                const SizedBox(height: 12),
                const Text(
                  "We couldn’t find any results",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(
                      0xFF191F25,
                    ), // Semantic Colors/Foreground/Primary
                    fontSize: 16, // Body Large
                  ),
                ),
                const SizedBox(
                  height: 24,
                ), // spacing-24 (bottom spacing if needed)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
