import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(String, String) addTasks;
  AddTaskDialog(this.addTasks);
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

// 할 일 추가 다이얼로그
class _AddTaskDialogState extends State<AddTaskDialog> {
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('할 일 추가'),
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: '제목'),
            onChanged: (value) {
              title = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: '설명'),
            onChanged: (value) {
              description = value;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('취소'),
        ), //취소 버튼
        TextButton(
          onPressed: () {
            widget.addTasks(title, description); //할 일 추가(제목, 설명)
            Navigator.pop(context);
          },
          child: Text('추가'),
          //추가 버튼
        ),
      ],
    );
  }
}
