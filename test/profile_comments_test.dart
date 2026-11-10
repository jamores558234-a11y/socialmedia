import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_media/model/usercomment.dart';
import 'package:social_media/model/userdata.dart';
import 'package:social_media/views/profile.view.dart';
import 'package:social_media/views/postlist.dart';

void useTallViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(800, 1600);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  testWidgets('shows all comments attached to a post', (tester) async {
    useTallViewport(tester);
    final userdata = UserData();
    final post = userdata.userlist.first;
    post.comments.add(
      Usercomment(
        commenterImg: userdata.commentlist[1].commenterImg,
        commenterName: 'Another commenter',
        commenterTime: 'Just now',
        commenterContent: 'A second comment',
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ProfileView(userdata: userdata, userposts: post),
      ),
    );

    expect(find.text('awdawdawd'), findsOneWidget);
    expect(find.text('sgawdawdawd'), findsNothing);
    expect(find.text('hfdawdawdawd'), findsNothing);
    expect(find.text('hrscawdawdawd'), findsNothing);
    expect(find.text('A second comment'), findsNothing);
    expect(post.commentCount, 2);

    await tester.tap(find.text('View all comments'));
    await tester.pumpAndSettle();
    expect(find.text('A second comment'), findsOneWidget);
  });

  testWidgets('view all comments opens the complete comment list', (
    tester,
  ) async {
    useTallViewport(tester);
    final userdata = UserData();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: Postlist(userdata: userdata)),
      ),
    );

    final viewAllComments = find.text('Comments').first;
    await tester.ensureVisible(viewAllComments);
    await tester.tap(viewAllComments);
    await tester.pumpAndSettle();

    expect(find.byType(ProfileView), findsOneWidget);
    expect(find.text('All comments'), findsOneWidget);
    expect(find.text('View all comments'), findsOneWidget);
    expect(find.text('awdawdawd'), findsOneWidget);
    await tester.tap(find.text('View all comments'));
    await tester.pumpAndSettle();
    expect(find.text('Show fewer comments'), findsOneWidget);
  });

  testWidgets('likes a comment and adds a reply', (tester) async {
    useTallViewport(tester);
    final userdata = UserData();
    final post = userdata.userlist.first;
    final comment = post.comments.first;

    await tester.pumpWidget(
      MaterialApp(
        home: ProfileView(userdata: userdata, userposts: post),
      ),
    );

    final likeButton = find.widgetWithText(TextButton, 'Like').at(1);
    await tester.tap(likeButton);
    await tester.pump();
    expect(comment.isLiked, isTrue);

    final replyButton = find.text('Reply').first;
    await tester.tap(replyButton);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'A thoughtful reply');
    await tester.tap(find.text('Post'));
    await tester.pumpAndSettle();

    expect(find.text('A thoughtful reply'), findsOneWidget);
    expect(comment.replies, hasLength(1));
    expect(post.commentCount, 2);
  });
}