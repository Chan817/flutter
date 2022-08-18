import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome'),
      ),
      body: Column(
      children: List.generate(
          taskList.length, (index) {
        return CustomText(text: taskList[index]);
      }),
    ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;

  CustomText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontSize: 40),),
    );
   }
}

List <String> taskList = ['Task 10', 'Task 22', 'Task 3'];