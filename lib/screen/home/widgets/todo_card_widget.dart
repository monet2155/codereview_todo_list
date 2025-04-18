import 'package:flutter/material.dart';

class TodoCardWidget extends StatefulWidget {
  const TodoCardWidget({super.key, required this.todo});

  final String todo;

  @override
  State<TodoCardWidget> createState() => _TodoCardWidgetState();
}

class _TodoCardWidgetState extends State<TodoCardWidget> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(
            value: isDone,
            onChanged: (value) {
              setState(() {
                isDone = value!;
              });
            },
          ),
          Text(widget.todo, style: TextStyle(color: Colors.black, decoration: isDone ? TextDecoration.lineThrough : null)),
        ],
      ),
    );
  }
}
