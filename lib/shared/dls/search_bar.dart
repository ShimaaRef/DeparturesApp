import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onTap;
  final ValueChanged<String> onChanged;
  final bool showLeadingIcon;
  final bool showFirstTrailingIcon;
  final bool showSecondTrailingIcon;
  final IconData? leadingIcon;
  final IconData? trailingIcon1;
  final IconData? trailingIcon2;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Search for station',
    this.onTap,
    this.showLeadingIcon = true,
    this.showFirstTrailingIcon = true,
    this.showSecondTrailingIcon = false,
    this.leadingIcon = Icons.search,
    this.trailingIcon1 = Icons.clear,
    this.trailingIcon2,
  });

  @override
  Widget build(BuildContext context) {
    final hasCustomInteraction = onTap != null;

    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: hasCustomInteraction,
        child: Container(
          constraints: const BoxConstraints(minWidth: 360, maxWidth: 720),
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.white, // Background/Primary
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              width: 1,
              color: hasCustomInteraction
                  ? const Color(0xFF022C63) // Pressed
                  : const Color(0xFF191F25), // Default
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              if (showLeadingIcon && leadingIcon != null)
                Icon(
                  leadingIcon,
                  size: 24,
                  color: const Color(0xFF666F7A), // Tertiary
                ),
              const SizedBox(width: 10),

              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF191F25),
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666F7A),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              if (showFirstTrailingIcon && trailingIcon1 != null)
                IconButton(
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                  icon: Icon(trailingIcon1, color: const Color(0xFF666F7A)),
                  iconSize: 24,
                  padding: EdgeInsets.zero,
                ),

              if (showSecondTrailingIcon && trailingIcon2 != null)
                IconButton(
                  onPressed: () {},
                  icon: Icon(trailingIcon2, color: const Color(0xFF666F7A)),
                  iconSize: 24,
                  padding: EdgeInsets.zero,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
