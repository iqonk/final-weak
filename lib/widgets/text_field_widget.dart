import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const TextFieldWidget({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }
}