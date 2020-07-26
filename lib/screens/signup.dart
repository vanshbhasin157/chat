import 'package:flutter/material.dart';

import '../widget/widget.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
final formKey = GlobalKey<FormState>();
TextEditingController userNameTextEditingController = new TextEditingController();
TextEditingController emailTextEditingController = new TextEditingController();
TextEditingController passwordTextEditingController = new TextEditingController();


class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context) ,
      body: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height-50,
              alignment: Alignment.bottomCenter,
                        child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Form(
                      key: formKey,
                                          child: Column(
                        children: [
                          TextFormField(
                        controller: userNameTextEditingController,
                        style: simpleTextField(),
                        decoration: textFieldInputDecoration("Username")                    
                      ),
                      TextFormField(
                        controller: emailTextEditingController,
                        style: simpleTextField(),
                        decoration: textFieldInputDecoration("Email")                    
                      ),
                      TextFormField(
                        controller: passwordTextEditingController,
                        decoration: textFieldInputDecoration("Password")
                      ),
                        ],
                      ),
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
                      child: Text("Sign Up", style:TextStyle(
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
                      child: Text("Sign Up with Google", style:TextStyle(
                        color: Colors.black,
                        fontSize: 17
                      ) ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account", style: simpleTextField(),),
                        Text("Sign'In  now", style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),),


                      ],
                    ),
                    SizedBox(height: 50,)
                  ],
                )
                ),
            ),
          ),
    );
  }
}