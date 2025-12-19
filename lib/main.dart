import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TasksListScreen());
  }
}

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  final List<String> tasks = const ['Задача 1', 'Задача 2', 'Задача 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список задач')),
      body: ListView.separated(
        itemCount: tasks.length,

        separatorBuilder: (context, index) {
          return const Divider();
        },

        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.check_box_outline_blank),
            title: Text(tasks[index]),
            onTap: () {
              // Вариант 1: print
              print(tasks[index]);

              // Вариант 2: SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Вы выбрали: ${tasks[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}
