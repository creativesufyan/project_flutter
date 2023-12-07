import 'package:flutter/material.dart';
import 'package:task_maneger/ui/widgets/profile_summery_card.dart';
import 'package:task_maneger/ui/widgets/task_card.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
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
