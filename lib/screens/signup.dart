import 'package:chat/helper/helperFunc.dart';
import 'package:chat/services/auth.dart';
import 'package:chat/services/database.dart';
import 'package:flutter/material.dart';

import '../widget/widget.dart';
import 'chatRoom.dart';
class SignUp extends StatefulWidget {
    final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  AuthMethods authMethdos = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  bool isLoading = false;
final formKey = GlobalKey<FormState>();
TextEditingController userNameTextEditingController = new TextEditingController();
TextEditingController emailTextEditingController = new TextEditingController();
TextEditingController passwordTextEditingController = new TextEditingController();
HelperFunc helperFunc = new HelperFunc();
signMeUp(){
  if(formKey.currentState.validate())
  {
    Map<String, String> userInfoMap ={
        "name" : userNameTextEditingController.text,
        "email": emailTextEditingController.text
      };

      HelperFunc.saveUserNameSharedPreference(userNameTextEditingController.text);
      HelperFunc.saveUserEmailSharedPreference(emailTextEditingController.text);

    setState(() {
      isLoading = true;
    });
    authMethdos.signUpwithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val){
      // print("${val.uid}");
      
      databaseMethods.uploadUserInfo(userInfoMap);
      HelperFunc.saveUserLoggedInSharedPreference(true);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => ChatRoom()
        ));
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context) ,
      body: isLoading? Container(child:Center(child: CircularProgressIndicator()) ,):SingleChildScrollView(
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
                          return val.isEmpty || val.length < 2 ? "Please provide a valid username" : null;
                        },
                        controller: userNameTextEditingController,
                        style: simpleTextField(),
                        decoration: textFieldInputDecoration("Username")                    
                      ),
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
                          return val.length >6 ? null: "Please provide password with 6+ characters ";
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
                          signMeUp();
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
                        child: Text("Sign Up", style:TextStyle(
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
                        GestureDetector(
                          onTap: (){
                            widget.toggle();
                          },
                                                  child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text("Sign'In  now", style: TextStyle(
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