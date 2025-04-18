import 'package:codereview_todo_list/ui/home/widgets/add_task_dialog.dart';
import 'package:flutter/material.dart';

//todolist 메인 화면
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do-List')),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => showDialog(
              context: context,
              builder: (context) => AddTaskDialog(_addTask),
            ),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks[index]['title'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  tasks[index]['description'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('날짜: ${tasks[index]['date']}'),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> tasks = [
    {'title': '과제하기', 'description': '코딩', 'date': DateTime.now()},
  ];

  /// To Do List 추가
  void _addTask(String title, String description) {
    setState(() {
      tasks.add({
        'title': title,
        'description': description,
        'date': DateTime.now(),
      });
    });
  }
}
