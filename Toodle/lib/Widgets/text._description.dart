import 'package:flutter/material.dart';

class CustomTextFieldDescription extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextFieldDescription({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.grey.withOpacity(.2),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            border: InputBorder.none),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        maxLength: 200,
      ),
    );
  }
}
