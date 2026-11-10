

import 'account.dart';
import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';

class UserData {
  UserData() {
    userlist[0].comments.add(commentlist[0]);
    userlist[1].comments.add(commentlist[1]);
    userlist[2].comments.add(commentlist[2]);
    userlist[3].comments.add(commentlist[3]);
  }

  List<UserPost> userlist = [

    UserPost(
      userimg: 'assets/Rene.jpg',
      username: 'Rene Baterbonia',
      usertime: '2 hours ago',
      usercontent: 'Just a Kid with a big dream',
      userpostimg: 'assets/Rene.jpg',
      numshare: '1000',
      isLiked: false,
      comments: [],
    ),
    UserPost(
      userimg: 'assets/malupiton.jpg',
      username: 'Malupiton',
      usertime: '3 hours ago',
      usercontent: 'Burger ka Sakin',
      userpostimg: 'assets/malupiton.jpg',
      numshare: '100',
      isLiked: false,
      comments: [],
    ),
    UserPost(
      userimg: 'assets/adili.jpg',
      username: 'Divine Adili',
      usertime: '5 hours ago',
      usercontent: 'Basketball is life',
      userpostimg: 'assets/adili.jpg',
      numshare: '50000',
      isLiked: true,
      comments: [],
    ),
    UserPost(
      userimg: 'assets/nina.jpg',
      username: 'Nina Wong',
      usertime: '10 hours ago',
      usercontent: 'Para kang sumaccess',
      userpostimg: 'assets/nina.jpg',
      numshare: '500',
      isLiked: true,
      comments: [],
    ),
  ];

  List<Friend> friendlist = [
    Friend(img: 'assets/Rene.jpg', name: 'Rene Baterbonia'),
    Friend(img: 'assets/malupiton.jpg', name: 'Malupiton'),
    Friend(img: 'assets/adili.jpg', name: 'Divine Adili'),
    Friend(img: 'assets/nina.jpg', name: 'Nina Wong'),
    
  ];

  List<Usercomment> commentlist = [
    Usercomment(commenterImg: 'assets/Rene.jpg', 
                commenterName: 'Rene Baterbonia', 
                commenterTime: '2 hours ago', 
                commenterContent: 'ano'),
    Usercomment(commenterImg: 'assets/malupiton.jpg', 
                commenterName: 'Malupiton', 
                commenterTime: '3 hours ago', 
                commenterContent: 'wow'),
    Usercomment(commenterImg: 'assets/adili.jpg', 
                commenterName: 'Divine Adili', 
                commenterTime: '5 hours ago', 
                commenterContent: 'HAHAHAHA'),
    Usercomment(commenterImg: 'assets/nina.jpg', 
                commenterName: 'Nina Wong', 
                commenterTime: '10 hours ago', 
                commenterContent: 'SHEESH'), 

  ];

  Account myUserAccount = Account(name:'Jefrel Jay Amores',
                                  email:'jefreljayamores@gmail.com',
                                  img:'assets/Rene.jpg',
                                  numFollowers:'1000000',
                                  numPosts:'1',
                                  numFollowing:'5',
                                  numFriends:'100'
    
  );

}