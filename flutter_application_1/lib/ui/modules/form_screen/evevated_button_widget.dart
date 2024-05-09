import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final Function () onPressed;
  const ElevatedButtonWidget({required this.onPressed, super.key});

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return ElevatedButton(
      style: style,
      onPressed: ()=>widget.onPressed(),
      child: const Text('Salvar'),
    );
  }
}
