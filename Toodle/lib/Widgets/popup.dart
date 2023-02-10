import 'package:flutter/material.dart';

class MyPopupMenuButton extends StatefulWidget {
  const MyPopupMenuButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPopupMenuButtonState createState() => _MyPopupMenuButtonState();
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
      },
      child: TextButton(
        onPressed: null,
        child: Text(_selectedCategory),
      ),
    );
  }
}
