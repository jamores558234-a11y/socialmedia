import 'package:flutter/material.dart';
import 'model/userdata.dart';
import 'views/friendslist.dart';
import 'views/infoheader.dart';
import 'views/mainheader.dart';
import 'views/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  Userdata userdata = Userdata();

  var followTxtstyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          Mainheader(userdata: userdata),
          Infoheader(userdata: userdata),
          Friendlist(userdata: userdata),
          const SizedBox(height: 20),
          Padding(padding: 
          const EdgeInsets.only(left: 8.0),
          child: Row(children: [
            Text('Posts', style: followTxtstyle)]),
          ),
          const SizedBox(height: 20),
          Postlist(userdata: userdata), 
        ],
      ),
    );
  }
}