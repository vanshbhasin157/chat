import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context){
  return AppBar(
    title: new Text('Batein'),
  );
}

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
    color: Colors.white,
    ),
    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
                      
    ),
    enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white)
    )
  );
}

TextStyle simpleTextField(){
  return  TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  );
}