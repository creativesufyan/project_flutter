import 'package:flutter/material.dart';
import 'package:task_maneger/ui/widgets/profile_summery_card.dart';
import 'package:task_maneger/ui/widgets/task_card.dart';

class CancelledTasks extends StatefulWidget {
  const CancelledTasks({super.key});

  @override
  State<CancelledTasks> createState() => _CancelledTasksState();
}

class _CancelledTasksState extends State<CancelledTasks> {
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
