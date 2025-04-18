import 'package:codereview_todo_list/pages/list_page/list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends ConsumerState<RegistPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

DateTime _selectedDate = DateTime.now(); //날짜 초기값
 /// 날짜 선택 다이얼로그 띄우기
  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('할 일 추가'),//상단 제목
      ),
      body: Column(
        children: [
          //제목
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: '제목'),
          ),
          SizedBox(height: 12,),
          //소제목
          TextField(
            controller: _contentController,
            decoration: InputDecoration(labelText: '소제목'),
          ),
          SizedBox(height: 12,),
          TextField(
            decoration: InputDecoration(labelText: '소제목'),
          ),
          SizedBox(height: 12),
          Row(
            children: [
                Text(
                  '날짜: ${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => selectDate(context),
                  child: Text('날짜 선택'),
                ),
            ],
          ),
          SizedBox(height: 20),

        //등록버튼
        ElevatedButton(onPressed: (){
          final title = _titleController.text;
          final content = _contentController.text;
          final date = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}';
          if (title.isNotEmpty && content.isNotEmpty) {
            ref.read(todoViewModelProvider.notifier).updateState(title,content,date);
            Navigator.pop(context);
          }
        }, 
        style: ElevatedButton.styleFrom(
          minimumSize:Size(200, 60),
        ),
        child: Text('등록'))
        ],
      ),
    );
  }
}