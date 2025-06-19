import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../provider/task_provider.dart';
import '../l10n/app_localizations.dart';

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
    final locale = AppLocalizations.of(context);
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: NeumorphicAppBar(title: Text(locale.addTask)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Neumorphic(
                    style: const NeumorphicStyle(depth: -2),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: locale.taskName),
                      validator: (v) =>
                          v == null || v.isEmpty ? locale.enterName : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Neumorphic(
                    style: const NeumorphicStyle(depth: -2),
                    child: TextFormField(
                      controller: _descriptionController,
                      decoration:
                          InputDecoration(labelText: locale.taskDescription),
                      validator: (v) =>
                          v == null || v.isEmpty ? locale.enterDescription : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _deadline == null
                              ? locale.noDeadline
                              : '${locale.due}: ${_deadline!.toLocal()}'
                                  .split('.')
                                  .first,
                        ),
                      ),
                      NeumorphicButton(
                        onPressed: _pickDeadline,
                        style: const NeumorphicStyle(depth: 4),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Text(locale.selectDeadline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: locale.status),
                    value: _status,
                    items: [
                      DropdownMenuItem(value: 'urgent', child: Text(locale.urgent)),
                      DropdownMenuItem(value: 'important', child: Text(locale.important)),
                      DropdownMenuItem(value: 'simple', child: Text(locale.simple)),
                    ],
                    onChanged: (val) => setState(() => _status = val),
                    validator: (v) => v == null ? locale.selectStatus : null,
                  ),
                  const SizedBox(height: 20),
                  NeumorphicButton(
                    onPressed: _saveTask,
                    style: const NeumorphicStyle(depth: 4),
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Text(locale.save),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
