import 'package:flutter/material.dart';

class MyPopupMenuButton extends StatefulWidget {
  final TextEditingController controller;
  const MyPopupMenuButton({super.key, required this.controller});

  @override
  State<MyPopupMenuButton> createState() => _MyPopupMenuButtonState();
}

class _MyPopupMenuButtonState extends State<MyPopupMenuButton> {
  String _selectedCategory = 'Category';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(value: 'Personal', child: Text('Personal')),
        const PopupMenuItem(value: 'Work', child: Text('Work')),
        const PopupMenuItem(value: 'Hobby', child: Text('Hobby')),
      ],
      onSelected: (value) {
        setState(() {
          _selectedCategory = value;
        });
        widget.controller.text = value;
      },
      child: TextButton(
        onPressed: null,
        child: Text(_selectedCategory),
      ),
    );
  }
}
