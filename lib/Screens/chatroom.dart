import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash/Modals/authenticate.dart';
import 'package:splash/Screens/search.dart';
import 'package:splash/Services/auth.dart';
import 'package:splash/Widgets/temp.dart';

class chatroom extends StatefulWidget {
  chatroom({Key? key}) : super(key: key);

  @override
  State<chatroom> createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Splash',
          style: TextStyle(
              fontSize: 20.0, letterSpacing: 2, fontFamily: 'poppins'),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              authMethods.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => authenticate()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => search())));
        },
      ),
    );
  }
}
