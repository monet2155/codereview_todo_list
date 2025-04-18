import 'package:codereview_todo_list/model/to_do_model.dart';
import 'package:codereview_todo_list/screen/home/widgets/todo_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List<ToDoModel> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("TodoList")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return TodoCardWidget(
                    todo: todoList[index],
                    removeList: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(flex: 3, child: TextField(controller: _controller, onChanged: (value) => _controller.text = value)),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.deepPurple)),
                        onPressed: () {
                          setState(() {
                            if (_controller.text.isNotEmpty) {
                              todoList.add(ToDoModel(_controller.text, false));
                              _controller.clear();
                            }
                          });
                        },
                        child: Text("추가하기", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
