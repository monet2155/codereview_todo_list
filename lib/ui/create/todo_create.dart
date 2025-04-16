import 'package:flutter/material.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('글 쓰기'),
          actions: [
            GestureDetector(
              onTap: () {
                print('글 쓰기 완료 버튼');
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
                      decoration: InputDecoration(hintText: '제목을 적어주세요.'),
                    ),
                    SizedBox(
                      height: 200,
                      child: TextField(
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
