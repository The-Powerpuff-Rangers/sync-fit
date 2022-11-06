import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String label;
  final TextInputType type;
  final int? maxLines;
  final TextEditingController controller;
  final bool trailingIcon;
  const FormWidget({
    Key? key,
    this.maxLines,
    required this.label,
    this.trailingIcon = false,
    required this.controller,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        autocorrect: true,
        controller: controller,
        enableIMEPersonalizedLearning: true,
        enableSuggestions: true,
        keyboardType: type,
        maxLines: maxLines,
        
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w200,
              color: Color(0xff636364),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1))),
      ),
    );
  }
}
