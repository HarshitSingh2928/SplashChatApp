import 'package:cloud_firestore/cloud_firestore.dart';

class Dbfunctions {
  searchUser(String username) {}
  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }
}
