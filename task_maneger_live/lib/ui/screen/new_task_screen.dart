import 'package:flutter/material.dart';
import 'package:task_maneger/ui/screen/add_new_task_screen.dart';
import 'package:task_maneger/ui/widgets/profile_summery_card.dart';
import 'package:task_maneger/ui/widgets/summery_card.dart';
import 'package:task_maneger/ui/widgets/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummeryCard(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  children: [
                    SummeryCard(
                      count: "9",
                      title: "New",
                    ),
                    SummeryCard(
                      count: "9",
                      title: "Completed",
                    ),
                    SummeryCard(
                      count: "9",
                      title: "Cancelled",
                    ),
                    SummeryCard(
                      count: "9",
                      title: "In Progress",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskCard();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
