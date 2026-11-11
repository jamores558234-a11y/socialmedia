import 'package:flutter/material.dart';
import '/model/userdata.dart';
import '/model/userpost.dart';
import '/views/profile.view.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  var nametxtStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  Future<void> gotoPage(Userpost userPost) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileView(userPost: userPost),
      ),
    );

    setState(() {});
  }

  Widget buttons(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: userPost.isLiked ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            userPost.isLiked = !userPost.isLiked;
          });
        },
        icon: const Icon(Icons.thumb_up),
        label: const Text('Like'),
      ),

      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
        ),
        onPressed: () {
          gotoPage(userPost);
        },
        icon: const Icon(Icons.message),
        label: const Text('Comment'),
      ),

      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
        ),
        onPressed: () {},
        icon: const Icon(Icons.share),
        label: const Text('Share'),
      ),
    ],
  );

  Widget postCount(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userPost.totalCommentCount} Comments'),
      const SizedBox(width: 20),
      Text('${userPost.numshare} Shares'),
    ],
  );

  Widget postImage(Userpost userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.postimg),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );

  Widget postHeader(Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          Row(
            children: [
              Text('${userPost.time} · '),
              const Icon(Icons.people, size: 18),
            ],
          ),
        ],
      ),
    ],
  );

  Widget showPost(Userpost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(userPost.postcontent, style: nametxtStyle),
          ],
        ),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(userPost),
      SizedBox(
        height: 10,
        child: Container(color: Colors.grey),
      ),
      const SizedBox(height: 15),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.userdata.userList.length,
      itemBuilder: (context, index) {
        Userpost userPost = widget.userdata.userList[index];

        return InkWell(
          onTap: () {
            gotoPage(userPost);
          },
          child: showPost(userPost),
        );
      },
    );
  }
}