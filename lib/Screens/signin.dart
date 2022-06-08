import 'package:flutter/material.dart';
import 'package:splash/Screens/chatroom.dart';
import 'package:splash/Screens/signup.dart';
import 'package:splash/Services/auth.dart';
import 'package:splash/Widgets/temp.dart';
import 'package:splash/Widgets/widget.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  const SignIn(this.toggle);
  //SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  TextEditingController emailtextcontroller = new TextEditingController();
  TextEditingController passwordtextcontroller = new TextEditingController();
  signUpFun() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .signInWithEMail(
              emailtextcontroller.text, passwordtextcontroller.text)
          .then((value) => print("$value.userId"));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => chatroom()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Temp.appBar(),
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Temp.textField(
                            hintText: 'email',
                            editingController: emailtextcontroller),
                        Temp.textField(
                            hintText: 'password',
                            editingController: passwordtextcontroller),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
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
                                  Colors.redAccent.shade400
                                ])),
                            child: Text("Sign In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
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
                            Text("Don't Have An account?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUp(widget.toggle)));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(" Register Now",
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
            ),
    );
  }
}
