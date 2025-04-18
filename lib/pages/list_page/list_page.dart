import 'package:codereview_todo_list/pages/list_page/list_view_model.dart';
import 'package:codereview_todo_list/pages/list_page/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  List<bool> isChecked = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final todoList = ref.watch(todoViewModelProvider);
    if (todoList.todo.isEmpty) {}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 195, 195),
        centerTitle: true,
        title: Text('TO DO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: todoList.todo.length,
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemBuilder: (context, index) {
                  return ItemWidget(
                    index: index,
                    content: todoList.todo[index],
                    isChecked: isChecked,
                    ref: ref,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: registButton(context),
    );
  }
}