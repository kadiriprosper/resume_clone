import 'package:flutter/material.dart';

class SegmentTitleWidget extends StatelessWidget {
  const SegmentTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Icon(Icons.arrow_right_outlined),
        ],
      ),
    );
  }
}
