import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: TextField(
        decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.grey.withOpacity(.2),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            border: InputBorder.none),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        maxLength: 100,
      ),
    );
  }
}
