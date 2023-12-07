import 'package:flutter/material.dart';
import 'package:task_maneger/ui/screen/cancelledTask.dart';
import 'package:task_maneger/ui/screen/completed_task.dart';
import 'package:task_maneger/ui/screen/new_task_screen.dart';
import 'package:task_maneger/ui/screen/progressTask.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _selectedIndex = 0;
  final List<Widget> _screen = const [
    NewTaskScreen(),
    CompletedTask(),
    CancelledTasks(),
    ProgressTasks(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          _selectedIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        //showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add_task_outlined),label: "New Task"),
          BottomNavigationBarItem(icon: Icon(Icons.done),label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.close),label: "Cancelled"),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_circle_up),label: "Progress"),
        ],
      ),
    );
  }
}
