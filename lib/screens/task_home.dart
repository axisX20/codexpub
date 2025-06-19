import 'package:codex/provider/task_provider.dart';
import 'package:codex/provider/locale_provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../l10n/app_localizations.dart';
import 'add_task_screen.dart';

class TaskHomePage extends StatelessWidget {
  const TaskHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: NeumorphicAppBar(
          title: Text(locale.myTasks),
          actions: [
            PopupMenuButton<Locale>(
              icon: const Icon(Icons.language),
              onSelected: (localeSel) =>
                  context.read<LocaleProvider>().setLocale(localeSel),
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: const Locale('en'),
                  child: const Text('English'),
                ),
                PopupMenuItem(
                  value: const Locale('ar'),
                  child: const Text('\u0639\u0631\u0628\u064a'),
                ),
              ],
            ),
            NeumorphicButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddTaskScreen()),
                );
              },
              style: const NeumorphicStyle(depth: 4),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: tasks.isEmpty
              ? Center(child: NeumorphicText(locale.noTasks))
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
                      child: Neumorphic(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        style: const NeumorphicStyle(depth: -2),
                        child: ListTile(
                          title: Text(task.name),
                          subtitle: Text(
                            '${task.description}\n${locale.due}: ${task.deadline.toLocal().toString().split('.').first}\n${locale.status}: ${task.status}',
                          ),
                          isThreeLine: true,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
