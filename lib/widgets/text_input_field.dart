import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  TextInputField({
    required this.hintText,
    required this.labelText,
    required this.prefix,
  });
  final String hintText;
  final String labelText;
  final Icon prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefix,
      ),
    );
  }
}
