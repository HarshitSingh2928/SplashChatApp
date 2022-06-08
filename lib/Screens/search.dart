import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splash/Screens/user_data_model.dart';
import 'package:splash/Services/db.dart';
import 'package:splash/Widgets/temp.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  Dbfunctions database = new Dbfunctions();

  TextEditingController searchtextcontroller = new TextEditingController();

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');
  List<UserDataModel> userDataModel = [];

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List

    List<Object?> allData =
        querySnapshot.docs.map((doc) => doc.data()).toList();
    allData.map((e) => e['name']);
    var data = querySnapshot.docs.toList();
    data.forEach((element) {
      var datum = element.data().toString();
    });
    log(userDataModel.first.email);
    // print(allData);
    // var listTitles = allData.map((e) {
    //   var name = e['name'] ;
    //   var tit = SearchTitle(userName: , userEmail: userEmail)
    // }).toList();
  }

  // Future getData() async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection("users").get();
  //   Widget searchList() {
  //     return ListView.builder(
  //         itemCount: snapshot.docs.length,
  //         itemBuilder: (context, index) {
  //           return SearchTitle(userName: "", userEmail: "");
  //         });
  //   }
  // }

  // searchResult() {
  //   getData();
  //   searchResult() {
  //     database.searchUser(searchtextcontroller.text).then((val) {
  //       snapshot = val;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Temp.appBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchtextcontroller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'search username...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  )),
                  GestureDetector(
                    onTap: () {
                      getData();
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Icon(Icons.search)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchTitle extends StatelessWidget {
  final String userName, userEmail;
  const SearchTitle({required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                userName,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                userEmail,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(30)),
            child: Text('Message'),
          )
        ],
      ),
    );
  }
}
