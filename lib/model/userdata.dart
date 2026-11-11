import '/model/account.dart';
import '/model/friend.dart';
import '/model/usercomment.dart';
import '/model/userpost.dart';

class Userdata {
  
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/Rene.jpg',
      username: 'Rene Barterbonia',
      time: '2 hrs ago',
      postcontent: 'JUST A KID WITH A BIG DREAM(MAMAAAA!!)',
      postimg: 'assets/Rene.jpg',
      numcomments: '3',
      numshare: '5',
      isLiked: true,
      comments: [
        Usercomment(
          commenterImg: 'assets/malupiton.jpg',
          commenterName: 'Malupiton',
          commenterTime: '6 hrs',
          commenterContent: 'Sayanga bataa',
        ),
        Usercomment(
          commenterImg: 'assets/adili.jpg',
          commenterName: 'Divine Adili',
          commenterTime: '2 hrs',
          commenterContent: 'Condolence sa ato',
        ),
        Usercomment(
          commenterImg: 'assets/nina.jpg',
          commenterName: 'Nina Wong',
          commenterTime: '8 hrs',
          commenterContent: 'Gwapo raba bataa',
        ),
      ],
    ),

    Userpost(
      userimg: 'assets/adili.jpg',
      username: 'Divine Adili',
      time: '4 hrs ago',
      postcontent: 'Basketball is life!',
      postimg: 'assets/adili.jpg',
      numcomments: '1',
      numshare: '10',
      isLiked: true,
      comments: [
        Usercomment(
          commenterImg: 'assets/Rene.jpg',
          commenterName: 'Rene Barterbonia',
          commenterTime: '6 hrs',
          commenterContent: 'Sayang jd ta dol!',
        ),
      ],
    ),

    Userpost(
      userimg: 'assets/malupiton.jpg',
      username: 'Malupiton',
      time: '6 hrs ago',
      postcontent: 'Burger ka Sakin',
      postimg: 'assets/malupiton.jpg',
      numcomments: '1',
      numshare: '15',
      isLiked: true,
      comments: [
        Usercomment(
          commenterImg: 'assets/malupiton.jpg',
          commenterName: 'Malupiton',
          commenterTime: '6 hrs',
          commenterContent: 'HAHAHAHAHA',
        ),
       
      ],
    ),

    Userpost(
      userimg: 'assets/nina.jpg',
      username: 'Nina Wong',
      time: '10 hrs ago',
      postcontent: 'Malapit kanang sumaccess',
      postimg: 'assets/nina.jpg',
      numcomments: '0',
      numshare: '5',
      isLiked: true,
    
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/Rene.jpg', name: 'Rene Barterbonia'),
    Friend(img: 'assets/adili.jpg', name: 'Divine Adili'),
    Friend(img: 'assets/malupiton.jpg', name: 'Malupiton'),
    Friend(img: 'assets/nina.jpg', name: 'Nina Wong'),
   
  ];

  Account myUserAccount = Account(
    name: 'Rene Barterbonia',
    email: 'r.barterbonia.558234@umindanao.edu.ph',
    img: 'assets/Rene.jpg',
    numFollowers: '500.5K',
    numPosts: '1',
    numFollowing: '120',
    numFriends: '5',
  );
}