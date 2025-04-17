import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:codereview_todo_list/ui/create/todo_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoWidget extends ConsumerStatefulWidget {
  TodoWidget(this.todo, this.isDeleteMode, {super.key});
  TodoModel todo;
  bool isDeleteMode;

  @override
  ConsumerState<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends ConsumerState<TodoWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          child: Row(
            children: [
              widget.isDeleteMode
                  ? Checkbox(
                    value: false,
                    onChanged: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )
                  : SizedBox(width: 0, height: 0),
              Checkbox(
                value: widget.todo.isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              SizedBox(width: 20),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('리스트 클릭');
                    if (!widget.isDeleteMode) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // 데이터 할당해서 수정페이지 처럼 보이게 하기
                            return TodoCreate(widget.todo);
                          },
                        ),
                      );
                    }
                  },
                  child: Container(
                    color:
                        widget.isDeleteMode
                            ? Colors.grey[200]
                            : Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.todo.title,
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
                            '${widget.todo!.createdAt.year}-${widget.todo!.createdAt.month}-${widget.todo!.createdAt.day}',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
