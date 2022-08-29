import 'package:flutter/material.dart';
import 'package:jom_launch_flutter/provider/tasklist.provider.dart';
import 'package:provider/provider.dart';

import '../model/task.model.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListProvider>(
      create: (context)=> TaskListProvider(),
      child: Builder(
        builder: (context){
          return Scaffold(
            appBar: AppBar(
              title: Text('Awesome'),
            ),
            body: Consumer<TaskListProvider>(
              builder: (context, taskListProvider, child) {
                final taskList = taskListProvider.taskList;
                return ListView(
                  children: List.generate(
                    taskList.length, (index) {
                    return TaskContainer(task: taskList[index], index: index,);
                  },
                  ),
                );
              },),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final taskListProvider =
                    Provider.of<TaskListProvider>(context, listen: false);
                final taskList = taskListProvider.taskList;
                final newTask = Task(
                    title: 'Task ${taskList.length + 1}',
                    description: 'This is Task ${taskList.length + 1}');
                taskListProvider.addTask(newTask);
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;
  final int index;

  TaskContainer({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent.shade100,
          border: Border.all(color: Colors.green, width: 3.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    task.description,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Icon(Icons.edit,),
              onTap: (){
                //taskList.removeAt(index);
            },),
            InkWell(
              child: Icon(Icons.delete,),
              onTap: (){
                final taskListProvider = Provider.of<TaskListProvider>(context, listen: false);
                taskListProvider.deleteTask(index);
              },)
          ],
        ),
      ),
    );
   }
}

