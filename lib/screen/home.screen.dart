import 'package:flutter/material.dart';

import '../model/task.model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome'),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          taskList.length, (index) {
        return TaskContainer(task: taskList[index]);
      }),
    ),
    );
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;

  TaskContainer({required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent.shade100,
          border: Border.all(color: Colors.green, width: 3.0),),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: TextStyle(fontSize: 40),),
            SizedBox(height: 20,),
            Text(task.description, style: TextStyle(fontSize: 30),),
          ],

        ),
      ),
    );
   }
}

