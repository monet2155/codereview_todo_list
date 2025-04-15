import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('TODO_LIST'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index){
            return ListTile(
              title: Text('아이템 :')
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
        )
      ),
    );
  }
}
