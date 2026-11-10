import 'usercomment.dart';

class UserPost {
  final String userimg;
  final String username;
  final String usertime;
  final String usercontent;
  final String userpostimg;
  final String numshare;
  bool isLiked;
  final List<Usercomment> comments;

  int get commentCount {
    int countThread(Usercomment comment) =>
        1 +
        comment.replies.fold(0, (count, reply) => count + countThread(reply));

    return comments.fold(0, (count, comment) => count + countThread(comment));
  }

  UserPost({
    required this.userimg,
    required this.username,
    required this.usertime,
    required this.usercontent,
    required this.userpostimg,
    required this.numshare,
    required this.isLiked,
    required this.comments,
  });
}