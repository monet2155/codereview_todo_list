import 'package:codereview_todo_list/model/content.dart';
import 'package:codereview_todo_list/pages/list_page/list_view_model.dart';
import 'package:codereview_todo_list/pages/regist_page/regist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemWidget extends ConsumerStatefulWidget {
  final int index;
  final Content content;
  final List<bool> isChecked;
  final WidgetRef ref;

  ItemWidget({
    required this.index,
    required this.content,
    required this.isChecked,
    required this.ref,
  });

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends ConsumerState<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.content.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(widget.content.content),
              Text(widget.content.date),
            ],
          ),
          Spacer(),
          Checkbox(
            value: widget.isChecked[widget.index],
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked[widget.index] = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(todoViewModelProvider.notifier)
                  .deleteTodo(widget.content);
            },
            child: Icon(Icons.delete, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

Widget registButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegistPage()),
      );
    },
    child: Container(width: 50, height: 50, child: Icon(Icons.edit)),
  );
}