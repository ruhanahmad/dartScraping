import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scrapingdart/main.dart';
import 'package:scrapingdart/screens/userList.dart';



class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: 
      Container(height: 500,width: 500,child: Column(children: [
        Text("Welcome to Admin Panel",style: TextStyle(color: Colors.blue,fontSize: 30),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
          GestureDetector(
            onTap: () {
              Get.to(RecordListPage());
            },
            child: Column(
              children: [
                Container(height:200 ,width: 200,
                color: Colors.yellowAccent,
                child: Column(children: [
  Container(
    height: 60,
    width: 40,
    child: Icon(Icons.verified_user,size: 50,)),
                Container(height: 200,width: 200,color: Colors.yellow,child: Text("user",),),
                ],),
                ),
              
              ],
            ),
          ),
        
           GestureDetector(
            onTap: () {
              
            },
             child: Column(
               children: [
                 Icon(Icons.badge),
                 Container(height: 200,width: 200,color: Colors.yellow,child: Text("data"),),
               ],
             ),
           ),
        ],),
     Container(height: 200,width: 400,color: Colors.yellow,child: Text("Logout"),),
    
      ],),)
      ),
    );
  }
}