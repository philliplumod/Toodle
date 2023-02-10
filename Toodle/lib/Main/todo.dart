import 'package:flutter/material.dart';
import 'package:toodle/Widgets/popup.dart';
import 'package:toodle/Widgets/text_name.dart';
import 'package:intl/intl.dart';

import '../Widgets/label.dart';
import '../Widgets/text._description.dart';
import '../Widgets/time_picker.dart';

class TaskList extends StatelessWidget {
  final Function onAddTask;
  const TaskList({super.key, required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toodle'),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onAddTask();
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class TaskAdd extends StatefulWidget {
  const TaskAdd({super.key});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  final _descriptionController = TextEditingController();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  // final DateTime _selectedDateTime = DateTime.now();
  final TimeOfDay _selectedTime = TimeOfDay.now();
  final DateTime _selectedDate = DateTime.now();

  void _submitTask() {
    String taskName = _nameController.text;
    String taskDescription = _descriptionController.text;
    String categoryController = _categoryController.text;
    final taskTime =
        '${_selectedTime.hour}:${_selectedTime.minute} ${_selectedTime.hour < 12 ? "AM" : "PM"}';
    final taskDate =
        '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}';

    debugPrint("Name: $taskName");
    debugPrint("Description: $taskDescription");
    debugPrint("Category: $categoryController");
    debugPrint("Time: $taskDate and $taskTime");

    // Use the task name for your logic
  }

  void _openTaskInputScreen() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelWithPadding(labelText: 'Name'),
              CustomTextFieldName(
                controller: _nameController,
              ),
              const LabelWithPadding(labelText: 'Description'),
              CustomTextFieldDescription(
                controller: _descriptionController,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyPopupMenuButton(
                      controller: _categoryController,
                    ),
                    const MyPopupTimeButton(),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    _submitTask();
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaskList(onAddTask: _openTaskInputScreen),
    );
  }
}
