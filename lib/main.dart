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
class StudyPlanner extends StatefulWidget {
  const StudyPlanner({super.key});
@override
State<StudyPlanner> createState() => _StudyPlannerState();
}
class _StudyPlannerState extends State<StudyPlanner> {
  // LOGIC: Study goals
List<Map<String, dynamic>> goals = [
  {'subject': 'Flutter', 'hours': 3, 'done': false},
  {'subject': 'Web Technology', 'hours': 4, 'done': false},
  {'subject': 'Software Architecture', 'hours': 2, 'done': false},
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC: App bar
      appBar: AppBar(
        title: const Text('My Study Planner'),
        backgroundColor: Colors.blue,
      ),
      // DYNAMIC: Study goals
      body: Column(
  children: [
    const Text(
      'My Study Goals',
      style: TextStyle(fontSize: 24),
    ),
    Expanded(
  child: ListView.builder(
    itemCount: goals.length,
    itemBuilder: (context, index) {
      return Card(
  child: CheckboxListTile(
    title: Text(
      goals[index]['subject'],
      style: TextStyle(
        decoration: goals[index]['done']
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    ),
    subtitle: Text('${goals[index]['hours']} hours'),
    value: goals[index]['done'],
    onChanged: (value) {
      setState(() {
        goals[index]['done'] = value!;
      });
    },
    secondary: IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        setState(() {
          goals.removeAt(index);
        });
      },
    ),
  ),
);
    },
  ),
),
  ],
),
      // DYNAMIC: Add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
  String subject = '';
  String studyHours = '';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add Study Goal'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Subject',
              ),
              onChanged: (value) {
                subject = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Hours',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                studyHours = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (subject.trim().isNotEmpty &&
                  (int.tryParse(studyHours) ?? 0) > 0) {
                setState(() {
                goals.add({
                 'subject': subject.trim(),
                 'hours': int.parse(studyHours),
                 'done': false,
});
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
},
        child: const Icon(Icons.add),
      ),
    );
  }
}
