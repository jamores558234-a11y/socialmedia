import 'package:flutter/material.dart';
import '/model/userdata.dart';
import '/model/userpost.dart';
import '/views/profile.view.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final UserData userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  var nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  void gotoPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  Widget buttons(UserPost userPost) => Row(
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
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {
          gotoPage(
            context,
            ProfileView(userdata: widget.userdata, userposts: userPost),
          );
        },
        icon: const Icon(Icons.message),
        label: const Text('Comment'),
      ),
      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {},
        icon: const Icon(Icons.share),
        label: const Text('Share'),
      ),
    ],
  );

  Widget postCount(UserPost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () {
          gotoPage(
            context,
            ProfileView(userdata: widget.userdata, userposts: userPost),
          );
        },
        child: const Text('Comments'),
      ),
      const Text(''),
      const SizedBox(width: 20),
      Text('${userPost.numshare} Shares'),
    ],
  );

  Widget postImage(UserPost userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.userpostimg),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );

  Widget postHeader(UserPost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipOval(
          child: SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(
              userPost.userimg,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          Row(
            children: [
              Text('${userPost.usertime} · '),
              const Icon(Icons.people, size: 18),
            ],
          ),
        ],
      ),
    ],
  );

  Widget showPost(UserPost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(children: [Text(userPost.usercontent, style: nametxtStyle)]),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey)),
      const SizedBox(height: 15),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final userPosts = widget.userdata.userlist.cast<UserPost>();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: userPosts.map((userPost) {
          return InkWell(
            onTap: () {
              gotoPage(
                context,
                ProfileView(userdata: widget.userdata, userposts: userPost),
              );
            },
            child: showPost(userPost),
          );
        }).toList(),
      ),
    );
  }
}