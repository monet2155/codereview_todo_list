import 'package:codereview_todo_list/todo/todo_delete_list_view_model.dart';
import 'package:codereview_todo_list/todo/todo_list_view_model.dart';
import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:codereview_todo_list/ui/create/todo_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoWidget extends ConsumerStatefulWidget {
  TodoWidget(this.todo, this.isDeleteMode, this.setDeleteMode, {super.key});
  TodoModel todo;
  bool isDeleteMode;
  void Function() setDeleteMode;

  @override
  ConsumerState<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends ConsumerState<TodoWidget> {
  bool isChecked = false;
  bool isDeleteChecked = false;
  @override
  Widget build(BuildContext context) {
    final vm = ref.read(deleteListProvider.notifier);
    final todoVm = ref.read(todoListNotifier.notifier);

    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15, right: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              widget.isDeleteMode
                  ? Checkbox(
                    value: isDeleteChecked,
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          vm.add(widget.todo.id);
                        } else {
                          vm.remove(widget.todo.id);
                        }
                        isDeleteChecked = value;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )
                  : SizedBox(width: 0, height: 0),
              Checkbox(
                value: widget.todo.isChecked,
                onChanged: (value) {
                  setState(() {
                    todoVm.setChecked(widget.todo.id, value!);
                  });
                },
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onLongPress: widget.setDeleteMode,
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
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.todo.title,
                            style: TextStyle(
                              color:
                                  widget.isDeleteMode ? Colors.grey[400] : null,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '${widget.todo.createdAt.year}-${widget.todo.createdAt.month}-${widget.todo.createdAt.day}',
                          style: TextStyle(
                            color:
                                widget.isDeleteMode ? Colors.grey[400] : null,
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
