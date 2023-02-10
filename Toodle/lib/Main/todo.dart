import 'package:flutter/material.dart';
import 'package:toodle/Widgets/popup.dart';
import 'package:toodle/Widgets/text_name.dart';

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
                  children: const [
                    MyPopupMenuButton(),
                    MyPopupTimeButton(),
                  ],
                ),
              ),
              TextButton(onPressed: null, child: Text('Submit'))
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
