import 'package:chat/helper/helperFunc.dart';
import 'package:chat/widget/widget.dart';
import 'package:flutter/material.dart';

import '../widget/widget.dart';
class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = new TextEditingController();
TextEditingController passwordTextEditingController = new TextEditingController();

  bool isLoading = false;
  signIn(){
    if(formKey.currentState.validate()){
      HelperFunc.saveUserEmailSharedPreference(emailTextEditingController.text);

      setState(() {
        isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: appBarMain(context),
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
                             validator: (val){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter a valid email address";
                    },
                        controller: emailTextEditingController,
                        style: simpleTextField(),
                        decoration: textFieldInputDecoration("Email")                    
                      ),
                      TextFormField(
                        validator: (val){
                          return val.length >6 ? null: "Please provide a password  ";
                        },
                        obscureText: true,
                        style: simpleTextField(),
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
                    GestureDetector(
                      onTap: (){
                        signIn();
                      },
                                          child: Container(
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
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account", style: simpleTextField(),),
                        GestureDetector(
                          onTap: (){
                            widget.toggle();
                          },
                                                  child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text("Register now", style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),),
                          ),
                        ),


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