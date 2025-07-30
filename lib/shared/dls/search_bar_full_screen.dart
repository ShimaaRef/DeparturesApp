import 'package:departures_app/shared/dls/full_width_divider.dart';
import 'package:flutter/material.dart';

class SearchBarFullScreen extends StatelessWidget {
  final String labelText;
  final bool showLeadingIcon;
  final bool show1stTrailingIcon;
  final bool show2ndTrailingIcon;
  final bool show3rdTrailingIcon;
  final bool showDivider;
  final bool showAvatar;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onTrailingPressed;

  const SearchBarFullScreen({
    super.key,
    required this.controller,
    required this.onChanged,
    this.labelText = 'Supporting text',
    this.showLeadingIcon = false,
    this.show1stTrailingIcon = false,
    this.show2ndTrailingIcon = false,
    this.show3rdTrailingIcon = true,
    this.showDivider = false,
    this.showAvatar = false,
    this.onTrailingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header + Search Bar
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white, // Semantic Colors/Background/Primary
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 72,
          child: Row(
            children: [
              if (showLeadingIcon)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),

              // Input Text Field
              Expanded(
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  onChanged: onChanged,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    hintText: 'Search for station',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(
                        0xFF666F7A,
                      ), // Semantic Colors/Foreground/Tertiary
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(
                      0xFF191F25,
                    ), // Semantic Colors/Foreground/Primary
                  ),
                  cursorColor: const Color(0xFF191F25), // Caret color
                ),
              ),

              // Trailing icon
              if (show3rdTrailingIcon)
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onTrailingPressed,
                ),
            ],
          ),
        ),

        // Divider
        if (showDivider) const FullWidthDivider(),

        // Supporting text
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF666F7A), // Semantic Colors/Foreground/Tertiary
            ),
          ),
        ),
      ],
    );
  }
}
