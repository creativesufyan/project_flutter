import 'package:flutter/material.dart';
import 'package:task_maneger/ui/screen/edit_profile_screen.dart';

class ProfileSummeryCard extends StatelessWidget {
  const ProfileSummeryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            ),
          );
        }
      },
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: const Text(
        "Abu Sufyan",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: const Text(
        "abusufyan421@gmail.com",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      trailing: enableOnTap ? const Icon(Icons.arrow_forward) : null,
      tileColor: Colors.green,
    );
  }
}
