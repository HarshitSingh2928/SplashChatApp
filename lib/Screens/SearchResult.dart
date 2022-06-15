import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splash/Screens/conversation.dart';

class searchResult extends StatelessWidget {
  final String text;
  searchResult({Key? key, required this.text}) : super(key: key);
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            db.collection('users').where('name', isEqualTo: text).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Conversation()));
                  },
                  child: Card(
                    color: Colors.red,
                    child: ListTile(
                      title: Text(doc['name']),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
