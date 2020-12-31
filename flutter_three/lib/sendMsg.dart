import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Navigation Basics',
      home: new TodosScreen(
        todos: new List.generate(
          20,
          (index) => new Todo('Todo $index',
              'A description of what needs to be done for Todo $index'),
        ),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;
  TodosScreen({Key key, @required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todos'),
      ),
      body: new ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text(todos[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          new DetailScreen(todo: todos[index])),
                );
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${todo.title}"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Text('${todo.description}'),
      ),
    );
  }
}
