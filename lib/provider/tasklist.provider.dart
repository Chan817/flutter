import 'package:flutter/material.dart';

import '../model/task.model.dart';

class TaskListProvider extends ChangeNotifier{
  List <Task> taskList = [
    Task(title: 'Task 1', description: 'This is Task 1'),
    Task(title: 'Task 2', description: 'This is Task 2'),
    Task(title: 'Task 3', description: 'This is Task 3'),
  ];

  update(){
    notifyListeners();
  }

  addTask(Task task){
    taskList.add(task);
    notifyListeners();
  }

  deleteTask(int index){
    taskList.removeAt(index);
    notifyListeners();
  }
}