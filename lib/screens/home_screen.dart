import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];

  void addOrEditTask({Todo? todo, int? index}) {
    final titleController = TextEditingController(text: todo?.title ?? '');
    DateTime selectedDate = todo?.date ?? DateTime.now();

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text(todo == null ? 'Add Task' : 'Edit Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Task title',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          setDialogState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      child: const Text('Choose'),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    setState(() {
                      if (todo == null) {
                        todos.add(
                          Todo(
                            title: titleController.text,
                            date: selectedDate,
                          ),
                        );
                      } else {
                        todos[index!].title = titleController.text;
                        todos[index].date = selectedDate;
                      }
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final todayTasks = todos.where((todo) {
      return todo.date.day == today.day &&
          todo.date.month == today.month &&
          todo.date.year == today.year;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F1FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Today Tasks',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: todayTasks.isEmpty
            ? const Center(
                child: Text(
                  'No tasks for today',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : ListView.builder(
                itemCount: todayTasks.length,
                itemBuilder: (context, index) {
                  final task = todayTasks[index];
                  return TaskCard(
                    todo: task,
                    onChanged: (value) {
                      setState(() {
                        task.isDone = value!;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        todos.remove(task);
                      });
                    },
                    onEdit: () {
                      addOrEditTask(
                        todo: task,
                        index: todos.indexOf(task),
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF9BFF),
        onPressed: () => addOrEditTask(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
