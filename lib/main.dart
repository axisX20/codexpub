import 'package:codex/provider/task_provider.dart';
import 'package:codex/screens/task_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const TaskApp());

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MaterialApp(
        title: 'Task Manager',
        home: TaskHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
