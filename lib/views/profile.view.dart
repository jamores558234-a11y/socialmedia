import 'package:flutter/material.dart';
import '/model/usercomment.dart';
import '/model/userdata.dart';
import '/model/userpost.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    required this.userdata,
    required this.userposts,
  });

  final UserData userdata;
  final UserPost userposts;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserData get userdata => widget.userdata;
  UserPost get userposts => widget.userposts;
  final commentController = TextEditingController();
  bool isShowingAllComments = false;

  final nametxtStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  final boldtxtStyle = const TextStyle(fontWeight: FontWeight.bold);

  final boldtxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void showCommentComposer({Usercomment? replyTo}) {
    commentController.clear();
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(replyTo == null ? 'Add a comment' : 'Reply to comment'),
        content: TextField(
          controller: commentController,
          autofocus: true,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Write a comment...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final content = commentController.text.trim();
              if (content.isEmpty) return;

              setState(() {
                final comment = Usercomment(
                  commenterImg: userdata.myUserAccount.img,
                  commenterName: userdata.myUserAccount.name,
                  commenterTime: 'Just now',
                  commenterContent: content,
                );
                if (replyTo == null) {
                  userposts.comments.add(comment);
                  isShowingAllComments = true;
                } else {
                  replyTo.replies.add(comment);
                }
              });
              commentController.clear();
              Navigator.pop(dialogContext);
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  Widget commentThread(Usercomment comment, {int depth = 0}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12,
        left: (10 + depth * 24).clamp(10, 82).toDouble(),
        right: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(comment.commenterImg),
            radius: depth == 0 ? 20 : 16,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(35, 158, 158, 158),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.commenterName,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(comment.commenterContent),
                    ],
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        comment.commenterTime,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () => setState(() {
                        comment.isLiked = !comment.isLiked;
                      }),
                      style: TextButton.styleFrom(
                        foregroundColor: comment.isLiked
                            ? Colors.blue
                            : Colors.grey,
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      child: const Text('Like'),
                    ),
                    TextButton(
                      onPressed: () => showCommentComposer(replyTo: comment),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      child: const Text('Reply'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> commentThreads(List<Usercomment> comments, {int depth = 0}) {
    return comments
        .expand(
          (comment) => [
            commentThread(comment, depth: depth),
            ...commentThreads(comment.replies, depth: depth + 1),
          ],
        )
        .toList();
  }

  Widget commenters(UserPost userpost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [Text('${userpost.commentCount}', style: boldtxtStyle)],
        ),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('All comments', style: boldtxtStyle1),
            const Spacer(),
            TextButton(
              onPressed: () => setState(() {
                isShowingAllComments = !isShowingAllComments;
              }),
              child: Text(
                isShowingAllComments
                    ? 'Show fewer comments'
                    : 'View all comments',
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget buttons(UserPost userpost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: userpost.isLiked ? Colors.blue : Colors.grey,
              ),
              onPressed: () => setState(() {
                userpost.isLiked = !userpost.isLiked;
              }),
              icon: const Icon(Icons.thumb_up, size: 20),
              label: const Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: showCommentComposer,
              icon: const Icon(Icons.chat_bubble, size: 20),
              label: const Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
    ],
  );

  Widget userline(UserPost userpost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userpost.userimg),
          radius: 20,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userpost.username, style: nametxtStyle),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(userpost.usertime),
              const Text('.'),
              const Icon(Icons.group, size: 15, color: Colors.grey),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postimage(UserPost userpost) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [Text(userpost.usercontent)]),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            userpost.userpostimg,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          userline(userposts),
          postimage(userposts),
          buttons(userposts),
          commenters(userposts),
          if (userposts.comments.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('No comments yet.'),
            )
          else
            ...commentThreads(
              isShowingAllComments
                  ? userposts.comments
                  : userposts.comments.take(1).toList(),
            ),
        ],
      ),
    );
  }
}