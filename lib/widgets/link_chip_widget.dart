import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class LinkChipWidget extends StatelessWidget {
  const LinkChipWidget({
    Key? key,
    required this.label,
    required this.color,
    required this.shadowColor,
    required this.icon,
    required this.link,
  }) : super(key: key);

  final String label;
  final Color color;
  final Color shadowColor;
  final IconData icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(link),
      builder: (context, followLink) {
        return ActionChip(
          onPressed: followLink,
          avatar: Icon(
            icon,
            color: Colors.white,
          ),
          label: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: color,
          elevation: 1,
          shadowColor: shadowColor,
        );
      },
    );
  }
}
