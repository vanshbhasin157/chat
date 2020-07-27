import 'package:chat/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget/widget.dart';
import '../widget/widget.dart';
import '../widget/widget.dart';
import '../widget/widget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  QuerySnapshot searchSnapshot;
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();
  initiateSearch(){
    databaseMethods.getUsersByUsername(searchTextEditingController.text).then((val){
                  setState(() {
                    searchSnapshot = val;
                  });
                  });

  }
  createChatRoomAndStartConservation(String userName){
    List<String> users = [userName];
    databaseMethods.createChatRoom(chatRoomId, chatRoomMap)
  }


  Widget searchList(){
    return searchSnapshot!= null ? ListView.builder(
      itemCount: searchSnapshot.documents.length,
      shrinkWrap: true,
      itemBuilder: (context, index) 
      {
       return SearchTile(
         username : searchSnapshot.documents[index].data["name"],
         useremail: searchSnapshot.documents[index].data["email"],
       );
      }): Container();
      
  }

  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(children: [
          Container(
            color: Color(0x54FFFFFF),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: 
            Row(children: [
              Expanded(
                            child: TextField(style: simpleTextField(),
                            controller: searchTextEditingController,
                 decoration: InputDecoration(
                   hintText: "Search Username",
                   hintStyle: TextStyle(
                     color: Colors.white
                   ),
                   border: InputBorder.none
                 )),
              ),
              GestureDetector(
                onTap: (){
                  initiateSearch();               
                },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)
                              ),
                      
                  child: Icon(Icons.search)),
              )
            ],),
          ),
          searchList(),
        ],)
      ),
    );
  }
}

class SearchTile extends StatelessWidget {

  final String username;
  final String useremail;
SearchTile({this.username, this.useremail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(username, style: simpleTextField(),),
            Text(useremail, style: simpleTextField(),),

          ],),
          Spacer(),
          GestureDetector(
            onTap: (){

            },
                      child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text("Message", style: simpleTextField(),),
            ),
          )
        ],
      )
    );
  }
}