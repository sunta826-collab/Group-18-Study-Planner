import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//STATIC: Main application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My study Planner',
      home: StudyPlanner(),
    );
  }
}

// STATIC: Home screen
class StudyPlanner extends StatelessWidget {
  const StudyPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC: App bar
      appBar: AppBar(
        title: const Text('My Study Planner'),
        backgroundColor: Colors.blue,
      ),
      // STATIC: Study goals
      body: Column(
        children: [
          const Text('My Study Goals', style: TextStyle(fontSize: 24)),
          const Card(
            child: ListTile(title: Text('Flutter'), subtitle: Text('3 hours')),
          ),
          const Card(
            child: ListTile(
              title: Text('Web Technology'),
              subtitle: Text('4 hours'),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('Software Architecture'),
              subtitle: Text('2 hours'),
            ),
          ),
        ],
      ),
      // STATIC: Add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
