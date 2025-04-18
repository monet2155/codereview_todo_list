import 'package:codereview_todo_list/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './home/home_screen.dart';

void main() {
  runApp(ProviderScope(child: const TodoApp()));
}

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(TodoViewModelProvider);
    final todoVm = ref.read(TodoViewModelProvider.notifier);
    bool isChecked = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('TODO_LIST'),
        ),
        body: Center(
            child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemCount: todoState.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                    value: todoState[index].isDone, //isChecked,
                    onChanged: (bool? value) {
                      // setState(({
                      //   isChecked = value;
                      // }));
                      todoVm.done(index);
                    }),
                Text(todoState[index].text),
                GestureDetector(
                  onTap: () {
                    todoVm.removeTodo(index);
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        )),
        bottomSheet: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(
              20, 0, 20, MediaQuery.of(context).padding.bottom),
          child: TextField(
            onSubmitted: (text) {
              if (text.trim().isNotEmpty && text.length > 0) {
                todoVm.addTodo(text.trim());
              }
            },
            decoration: InputDecoration(
              hintText: '할일',
            ),
          ),
        ),
      ),
    );
  }
}
