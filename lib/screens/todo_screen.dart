import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';
import '../models/todo.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('할 일 목록'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          _TodoInput(),
          Expanded(
            child: todos.isEmpty
                ? const Center(child: Text('할 일이 없습니다. 새로운 할 일을 추가해보세요!'))
                : ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return _TodoItem(todo: todo);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _TodoInput extends ConsumerStatefulWidget {
  const _TodoInput();

  @override
  ConsumerState<_TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends ConsumerState<_TodoInput> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: '할 일을 입력하세요',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                _addTodo();
              },
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: _addTodo,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('추가'),
          ),
        ],
      ),
    );
  }

  void _addTodo() {
    if (_textController.text.trim().isNotEmpty) {
      ref.read(todoProvider.notifier).addTodo(_textController.text);
      _textController.clear();
    }
  }
}

class _TodoItem extends ConsumerStatefulWidget {
  const _TodoItem({required this.todo});

  final Todo todo;

  @override
  ConsumerState<_TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends ConsumerState<_TodoItem> {
  late TextEditingController _editingController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget.todo.title);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todo.isCompleted,
        onChanged: (_) {
          ref.read(todoProvider.notifier).toggleTodo(widget.todo.id);
        },
      ),
      title: _isEditing
          ? TextField(
              controller: _editingController,
              autofocus: true,
              onSubmitted: (newValue) {
                ref
                    .read(todoProvider.notifier)
                    .editTodo(widget.todo.id, newValue);
                setState(() {
                  _isEditing = false;
                });
              },
            )
          : Text(
              widget.todo.title,
              style: TextStyle(
                decoration:
                    widget.todo.isCompleted ? TextDecoration.lineThrough : null,
                color: widget.todo.isCompleted ? Colors.grey : null,
              ),
            ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                ref
                    .read(todoProvider.notifier)
                    .editTodo(widget.todo.id, _editingController.text);
              }
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref.read(todoProvider.notifier).removeTodo(widget.todo.id);
            },
          ),
        ],
      ),
    );
  }
}
