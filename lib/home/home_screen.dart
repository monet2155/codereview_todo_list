import 'package:codereview_todo_list/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(TodoViewModelProvider);
    final todoVm = ref.read(TodoViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('TODO_LIST'),
      ),
      body: Center(
          child: ListView.separated(
        itemCount: todoState.length,
        itemBuilder: (context, index) {
          return Text(todoState[index].text);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      )),
    );
  }
}
