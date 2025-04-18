import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/todo_item.dart';
import '../../providers/todo_item_providers.dart';

class AddItemPage extends ConsumerStatefulWidget {
  const AddItemPage({super.key});

  @override
  AddItemPageState createState() => AddItemPageState();
}

class AddItemPageState extends ConsumerState<AddItemPage> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  void _submit() {
    if (formKey.currentState!.validate()) {
      final newItem = TodoItem(
        title: titleController.text,
        note: noteController.text,
      );
      ref.read(todoViewModelProvider.notifier).addItem(newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('할일 작성'), backgroundColor: Colors.white),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: '제목',
                  labelText: '제목',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: noteController,
                decoration: InputDecoration(
                  hintText: '내용',
                  labelText: '내용',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 60),
              ElevatedButton(onPressed: _submit,
                  child: Text("Todo 저장")
              )
            ],
          ),
        ),
      ),
    );
  }
}
