import 'package:flutter/material.dart';
import '/model/userdata.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({super.key, required this.userdata});

  final UserData userdata;

  final followTxtStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Followers'),
            const SizedBox(width: 10),
            const Text('Following'),
            const SizedBox(width: 10),
            const Text('Posts'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userdata.myUserAccount.numFollowers, style: followTxtStyle),
            const SizedBox(width: 40),
            Text(userdata.myUserAccount.numFollowing, style: followTxtStyle),
            const SizedBox(width: 50),
            Text(userdata.myUserAccount.numPosts, style: followTxtStyle),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.grey),
      ],
    );
  }
}