import 'package:codereview_todo_list/model/to_do_model.dart';
import 'package:flutter/material.dart';

class TodoCardWidget extends StatefulWidget {
  const TodoCardWidget({super.key, required this.todo, required this.removeList});

  final ToDoModel todo;
  final Function() removeList;

  @override
  State<TodoCardWidget> createState() => _TodoCardWidgetState();
}

class _TodoCardWidgetState extends State<TodoCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(
            value: widget.todo.isDone,
            onChanged: (value) {
              setState(() {
                widget.todo.isDone = value!;
              });
            },
          ),
          Text(widget.todo.name, style: TextStyle(color: Colors.black, decoration: widget.todo.isDone ? TextDecoration.lineThrough : null)),

          Spacer(),
          GestureDetector(
            onTap: () {
              if (widget.todo.isDone) {
                widget.removeList();
              }
            },
            child: SizedBox(width: 50, child: widget.todo.isDone ? Icon(Icons.remove_circle_outline, color: Colors.red) : SizedBox()),
          ),
        ],
      ),
    );
  }
}
