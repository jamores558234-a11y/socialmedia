import 'package:flutter/material.dart';
import '/model/userdata.dart';

class Infoheader extends StatelessWidget {
  const Infoheader({super.key, required this.userdata});

  final Userdata userdata;

  final TextStyle followTxtstyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('Followers'), Text('Following'), Text('Posts')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(userdata.myUserAccount.numFollowers, style: followTxtstyle),
            Text(userdata.myUserAccount.numFollowing, style: followTxtstyle),
            Text(userdata.myUserAccount.numPosts, style: followTxtstyle),
            ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.grey),
      ],
    );
  }
}