import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  TodoWidget(this.todo, {super.key});
  TodoModel? todo;

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          color: Colors.amber,
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '할 일 제목입니다!!! 할 일 제목입니다!!! 할 일 제목입니다!!! 할 일 제목입니다!!! 할 일 제목입니다!!!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
