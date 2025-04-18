import 'package:codereview_todo_list/todo/todo_list_view_model.dart';
import 'package:codereview_todo_list/todo/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoCreate extends ConsumerStatefulWidget {
  TodoModel? todo;
  TodoCreate(this.todo, {super.key});

  @override
  ConsumerState<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends ConsumerState<TodoCreate> {
  late TextEditingController titleController = TextEditingController(
    text: widget.todo?.title ?? '',
  );
  late TextEditingController contentController = TextEditingController(
    text: widget.todo?.memo ?? '',
  );

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.todo == null ? '글 쓰기' : '글 수정하기'),
          actions: [
            GestureDetector(
              onTap: () {
                print('글 쓰기 완료 버튼');
                final vm = ref.read(todoListNotifier.notifier);

                if (widget.todo == null) {
                  // 추가
                  vm.add(
                    title: titleController.text,
                    memo: contentController.text,
                  );
                } else {
                  // 수정
                  vm.modify(
                    TodoModel(
                      id: widget.todo!.id,
                      title: titleController.text,
                      memo: contentController.text,
                      createdAt: widget.todo!.createdAt,
                      isChecked: widget.todo!.isChecked,
                    ),
                  );
                }

                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '완료',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(hintText: '제목을 적어주세요.'),
                    ),
                    SizedBox(
                      height: 200,
                      child: TextField(
                        controller: contentController,
                        textInputAction: TextInputAction.newline,
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(hintText: '할 일을 적어주세요'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
