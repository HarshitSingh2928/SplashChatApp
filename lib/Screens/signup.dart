import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splash/Screens/signin.dart';
import 'package:splash/Services/auth.dart';
import 'package:splash/Services/db.dart';

import '../Widgets/temp.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  Dbfunctions db = new Dbfunctions();

  TextEditingController userNameText = new TextEditingController();
  TextEditingController emailText = new TextEditingController();
  TextEditingController passwordText = new TextEditingController();
  TextEditingController cnfmpasswordText = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  signUpFun() {
    // if (formKey.currentState!.validate()) {
    Map<String, String> userInfoMap = {
      "name": userNameText.text,
      "email": emailText.text
    };
    setState(() {
      isLoading = true;
    });
    authMethods
        .signUpWithEmail(emailText.text, passwordText.text)
        .then((value) {
      //5 print("$value.userID")
    });

    db.uploadUserInfo(userInfoMap);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => SignIn(widget.toggle)));
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: Temp.appBar(),
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Temp.textField(
                          hintText: 'Username',
                          editingController: userNameText),
                      Temp.textField(
                          hintText: 'email', editingController: emailText),
                      Temp.textField(
                          hintText: 'password',
                          editingController: passwordText),
                      Temp.textField(
                          hintText: 'Confirm password',
                          editingController: cnfmpasswordText),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          signUpFun();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                Colors.redAccent,
                                Colors.redAccent.shade700
                              ])),
                          child: Text("Sign Up",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17)),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Text("Sign In With Google",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have An account? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          SignIn(widget.toggle))));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text("SignIn Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
