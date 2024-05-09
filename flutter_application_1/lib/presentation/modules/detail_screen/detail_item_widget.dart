import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  const DetailItemWidget({required this.title, required this.content, super.key});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(child: Text(content)),
      ],
    );
  }
}
