import 'package:flutter/material.dart';
import 'package:simple_store_app/helper.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
    required this.keyboardType,
  });
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hint, style: textFormHintStyle()),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              // hintText: hint,
              border: textFormBorderDecoration(),
              enabledBorder: textFormBorderDecoration(),
            ),
            controller: controller,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Please enter Valid Data";
              }
            },
          ),
        ],
      ),
    );
  }
}
