import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultItem extends StatelessWidget {
  final String name;
  final List<String> modes;
  final VoidCallback onTap;

  const SearchResultItem({
    super.key,
    required this.name,
    required this.modes,
    required this.onTap,
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
      default:
        return 'assets/icons/placeholder.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        name,
        style: const TextStyle(fontSize: 16, color: Color(0xFF191F25)),
      ),
      onTap: onTap,
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          children: modes.map((mode) {
            return Padding(
              padding: const EdgeInsets.only(right: 6),
              child: SvgPicture.asset(_iconFor(mode), width: 20, height: 20),
            );
          }).toList(),
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
