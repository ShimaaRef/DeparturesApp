import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultItem extends StatelessWidget {
  final String name;
  final List<String> modes;
  final VoidCallback onTap;
  final bool showDivider;

  const SearchResultItem({
    super.key,
    required this.name,
    required this.modes,
    required this.onTap,
    this.showDivider = true,
  });

  String _iconFor(String mode) {
    switch (mode) {
      case 'subway':
        return 'assets/icons/subway.svg';
      case 'bus':
        return 'assets/icons/bus.svg';
      case 'tram':
        return 'assets/icons/tram.svg';
      case 'regional':
        return 'assets/icons/regional.svg';
      case 'suburban':
        return 'assets/icons/suburban.svg';
      case 'express':
        return 'assets/icons/express.svg';
      case 'ferry':
        return 'assets/icons/ferry.svg';
      default:
        return 'assets/icons/placeholder.svg';
    }
  }

  List<Widget> _buildIcons() {
    final iconModes = modes.isNotEmpty ? modes : ['subway', 'bus', 'tram'];

    return iconModes
        .map((mode) => SvgPicture.asset(_iconFor(mode), height: 20, width: 20))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Color(0xFF191F25),
                  size: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF191F25),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Wrap(spacing: 4, runSpacing: 4, children: _buildIcons()),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF191F25),
                  size: 24,
                ),
              ],
            ),
          ),
          if (showDivider)
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFCED2DA),
              indent: 16,
              endIndent: 16,
            ),
        ],
      ),
    );
  }
}
