import 'package:flutter/material.dart';
import '/model/friend.dart';
import '/model/userdata.dart';

class Friendlist extends StatelessWidget {
  const Friendlist({super.key, required this.userdata});

  final UserData userdata;

  final followTxtStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(friend.img),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(friend.name),
            ),
          ],
        ),
      );

  Widget friendListGrid() => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.5,
        ),
        itemCount: userdata.friendlist.length,
        itemBuilder: (BuildContext ctx, index) {
          return friend(userdata.friendlist[index]);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Text('Friends', style: followTxtStyle),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            children: [
              Text('You have ${userdata.friendlist.length} friends'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        friendListGrid(),
        SizedBox(height: 10, child: Container(color: Colors.grey)),
      ],
    );
  }
}