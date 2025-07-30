import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeadingIcon;
  final bool show1stTrailingIcon;
  final bool show2ndTrailingIcon;
  final bool show3rdTrailingIcon;
  final bool showDivider;
  final bool showAvatar;
  final VoidCallback? onLeadingTap;
  final List<Widget>? trailingIcons;

  const TopAppBar({
    super.key,
    required this.title,
    this.showLeadingIcon = true,
    this.show1stTrailingIcon = false,
    this.show2ndTrailingIcon = false,
    this.show3rdTrailingIcon = true,
    this.showDivider = true,
    this.showAvatar = false,
    this.onLeadingTap,
    this.trailingIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: showLeadingIcon
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF191F25)),
                  onPressed: onLeadingTap ?? () => Navigator.pop(context),
                )
              : null,
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF191F25),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            if (show1stTrailingIcon)
              IconButton(
                icon: const Icon(Icons.search, color: Color(0xFF191F25)),
                onPressed: () {},
              ),
            if (show2ndTrailingIcon)
              IconButton(
                icon: const Icon(Icons.notifications, color: Color(0xFF191F25)),
                onPressed: () {},
              ),
            if (show3rdTrailingIcon)
              IconButton(
                icon: showAvatar
                    ? const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 12,
                      )
                    : const Icon(Icons.more_vert, color: Color(0xFF191F25)),
                onPressed: () {},
              ),
            ...?trailingIcons,
          ],
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF191F25), // Border Primary
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
