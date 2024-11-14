import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  // Lista para almacenar las tareas
  List<Map<String, dynamic>> tasks = [
    {"title": "Tarea 1", "isCompleted": false},
    {"title": "Tarea 2", "isCompleted": false},
    {"title": "Tarea 3", "isCompleted": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de tareas",
          style: TextStyle(fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tasks[index]["title"],
              style: TextStyle(
                decoration: tasks[index]["isCompleted"]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: tasks[index]["isCompleted"] ? Colors.grey : Colors.white,
              ),
            ),
            leading: Checkbox(
              value: tasks[index]["isCompleted"],
              onChanged: (bool? value) {
                setState(() {
                  tasks[index]["isCompleted"] = value;
                });
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        itemCount: tasks.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog() {
    String newTask = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Añadir nueva tarea'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: const InputDecoration(hintText: 'Escribe la nueva tarea'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (newTask.isNotEmpty) {
                  setState(() {
                    tasks.add({
                      "title": newTask,
                      "isCompleted": false,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Añadir'),
            ),
          ],
        );
      },
    );
  }
}