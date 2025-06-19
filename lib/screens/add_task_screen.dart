import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../provider/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _deadline;
  String? _status;

  void _pickDeadline() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;
    setState(() {
      _deadline = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  void _saveTask() {
    if (!_formKey.currentState!.validate() || _deadline == null || _status == null) {
      return;
    }
    final task = Task(
      name: _nameController.text,
      description: _descriptionController.text,
      deadline: _deadline!,
      status: _status!,
    );
    Provider.of<TaskProvider>(context, listen: false).addTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Task Name'),
                  validator: (v) => v == null || v.isEmpty ? 'Enter task name' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Task Description'),
                  validator: (v) => v == null || v.isEmpty ? 'Enter description' : null,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _deadline == null
                            ? 'No deadline chosen'
                            : 'Deadline: ${_deadline!.toLocal()}'.split('.').first,
                      ),
                    ),
                    TextButton(
                      onPressed: _pickDeadline,
                      child: const Text('Select Deadline'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Status'),
                  value: _status,
                  items: const [
                    DropdownMenuItem(value: 'urgent', child: Text('Urgent')),
                    DropdownMenuItem(value: 'important', child: Text('Important')),
                    DropdownMenuItem(value: 'simple', child: Text('Simple')),
                  ],
                  onChanged: (val) => setState(() => _status = val),
                  validator: (v) => v == null ? 'Select status' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveTask,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
