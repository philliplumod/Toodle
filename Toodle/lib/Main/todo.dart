import 'package:flutter/material.dart';

import '../Widgets/text.dart';

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
  void _openTaskInputScreen() {
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomTextField(),
          ],
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
