import 'package:flutter/material.dart';

typedef OnTimeSelected = void Function(TimeOfDay timeOfDay);

class MyPopupTimeButton extends StatefulWidget {
  final TextEditingController controller;

  const MyPopupTimeButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _MyPopupTimeButtonState createState() => _MyPopupTimeButtonState();
}

class _MyPopupTimeButtonState extends State<MyPopupTimeButton> {
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  Future<void> _showTimePicker() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        _timeOfDay = selectedTime;
      });
      // ignore: use_build_context_synchronously
      widget.controller.text = _timeOfDay.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: _showTimePicker, child: Text('PICK TIME')),
      ],
    );
  }
}
