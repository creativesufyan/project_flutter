import 'package:flutter/material.dart';
import 'package:task_maneger/ui/widgets/profile_summery_card.dart';
import 'package:task_maneger/ui/widgets/task_card.dart';

class ProgressTasks extends StatefulWidget {
  const ProgressTasks({super.key});

  @override
  State<ProgressTasks> createState() => _ProgressTasksState();
}

class _ProgressTasksState extends State<ProgressTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummeryCard(),
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
    );
  }
}
