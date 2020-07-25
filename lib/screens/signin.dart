import 'package:chat/widget/widget.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: appBarMain(context),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                TextField(
                  style: simpleTextField(),
                  decoration: textFieldInputDecoration("Email")                    
                ),
                TextField(
                  decoration: textFieldInputDecoration("Password")
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("Forgot Password?" , style: simpleTextField(),)
                ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff007EF4),
                        const Color(0xff2A75BC)
                      ]
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Text("Sign In", style:TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ) ),
                ),
                SizedBox(height: 16,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Text("Sign In with Google", style:TextStyle(
                    color: Colors.black,
                    fontSize: 17
                  ) ),
                )
              ],
            )
            ),
    );
  }
}