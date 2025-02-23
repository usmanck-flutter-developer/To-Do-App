import 'package:flutter/material.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  TodoHomePageState createState() => TodoHomePageState();
}

class TodoHomePageState extends State<TodoHomePage> {
  //
  List<Map<String, String>> todos = [];

  void showTodoDialog({int? index}) {
    //
    TextEditingController topicController =
        TextEditingController(text: index != null ? todos[index]['topic'] : '');
    TextEditingController detailsController = TextEditingController(
        text: index != null ? todos[index]['details'] : '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Add Todo' : 'Edit Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: topicController,
                decoration: InputDecoration(labelText: 'Topic'),
              ),
              TextField(
                controller: detailsController,
                decoration: InputDecoration(labelText: 'Details'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (topicController.text.isNotEmpty &&
                    detailsController.text.isNotEmpty) {
                  setState(() {
                    if (index == null) {
                      todos.add({
                        'topic': topicController.text,
                        'details': detailsController.text,
                      });
                    } else {
                      todos[index] = {
                        'topic': topicController.text,
                        'details': detailsController.text,
                      };
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                index == null ? 'Add' : 'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index]['topic']!),
            subtitle: Text(todos[index]['details']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => showTodoDialog(index: index),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteTodo(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTodoDialog(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
