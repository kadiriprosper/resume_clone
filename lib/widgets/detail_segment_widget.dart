import 'package:flutter/material.dart';

class DetailSegmentWidget extends StatelessWidget {
  const DetailSegmentWidget({
    Key? key,
    required this.details,
    required this.onClose,
  }) : super(key: key);

  final String details;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(minHeight: 120),
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.cancel),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0)
                .copyWith(bottom: 20),
            child: Center(
              child: Text(
                details,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
