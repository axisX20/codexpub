import 'package:codex/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import 'add_task_screen.dart';

class TaskHomePage extends StatelessWidget {
  const TaskHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddTaskScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: tasks.isEmpty
            ? const Center(child: Text('No tasks added yet.'))
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (_, index) {
                  final Task task = tasks[index];
                  return Dismissible(
                    key: ValueKey(task.name + task.deadline.toIso8601String()),
                    background: Container(color: Colors.red),
                    onDismissed: (_) {
                      Provider.of<TaskProvider>(context, listen: false)
                          .removeTask(index);
                    },
                    child: ListTile(
                      title: Text(task.name),
                      subtitle: Text(
                        '${task.description}\nDue: ${task.deadline.toLocal().toString().split('.').first}\nStatus: ${task.status}',
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
