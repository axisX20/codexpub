class Task {
  final String name;
  final String description;
  final DateTime deadline;
  final String status; // urgent, important, simple

  Task({
    required this.name,
    required this.description,
    required this.deadline,
    required this.status,
  });
}
