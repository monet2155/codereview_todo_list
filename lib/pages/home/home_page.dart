import 'package:codereview_todo_list/pages/add_item/add_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/todo_item_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoItems = ref.watch(todoViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AddItemPage();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: todoItems[index].isCompleted,
                    onChanged: (bool? value) {
                      ref
                          .read(todoViewModelProvider.notifier)
                          .toggleCompletion(index);
                    },
                  ),
                  title: Text(todoItems[index].title),
                  subtitle: Text(todoItems[index].note),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: todoItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
