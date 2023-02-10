import 'package:flutter/material.dart';

class MyPopupTimeButton extends StatefulWidget {
  const MyPopupTimeButton({super.key});

  @override
  MyPopupTimeButtonState createState() => MyPopupTimeButtonState();
}

class MyPopupTimeButtonState extends State<MyPopupTimeButton> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDateAndTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }

    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: _selectedTime);

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextButton(
            onPressed: _selectDateAndTime,
            child: const Text('Select Time and Date'),
          ),
        ),
      ],
    );
  }
}
