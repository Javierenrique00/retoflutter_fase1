import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({required this.title, required this.content, super.key});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${title}',style: TextStyle(fontWeight: FontWeight.bold),),
        Text('${content}'),
      ],
    );
  }
}
