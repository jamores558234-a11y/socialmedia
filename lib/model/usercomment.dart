class Usercomment {
  final String commenterImg;
  final String commenterName;
  final String commenterTime;
  final String commenterContent;
  bool isLiked;
  final List<Usercomment> replies;

  Usercomment({
    required this.commenterImg,
    required this.commenterName,
    required this.commenterTime,
    required this.commenterContent,
    this.isLiked = false,
    List<Usercomment>? replies,
  }) : replies = replies ?? [];
}