import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scrapingdart/main.dart';
import 'package:scrapingdart/screens/adminPanel.dart';
import 'package:scrapingdart/screens/loginSigns.dart';
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
        backgroundColor: Colors.black,
        body: 
      Container(
        height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width,
      child: Column(children: [
        Container(height: 250,width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        
        child: Column(children: [
  Text("Welcome to Admin Panel",style: TextStyle(color: Colors.white,fontSize: 20),),
        SizedBox(height: 15,),
        Container(height: 200,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,child: Text("data",style: TextStyle(color: Colors.orange),),)   

        
        
        ],),),
SizedBox(height: 20,),
      
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
          GestureDetector(
            onTap: () {
              Get.to(RecordListPage());
            },
            child: Container( 
              height: 220,
              width: 220,
            color: Colors.greenAccent,
            child: Column(children: [
  Icon(Icons.verified_user,size: 150,),
       
            Center(child: Text("Users"))
            
            ],),
            ),
          ),
        
             GestureDetector(
            onTap: () {
              Get.to(Addbrands());
            },
            child: Container( 
              height: 220,
              width: 220,
            color: Colors.greenAccent,
            child: Column(children: [
  Icon(Icons.badge,size: 150,),
       
            Center(child: Text("Brands"))
            
            ],),
            ),
          ),
        ],),
        SizedBox(height: 20,),
    //  Container(height: 200,width: 400,color: Colors.yellow,child: Text("Logout"),),
           GestureDetector(
            onTap: () async{
    
  await FirebaseAuth.instance.signOut();
   Get.to(LoginSigns());

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                height: 100,
                width: MediaQuery.of(context).size.width,
              color: Colors.greenAccent,
              child: Column(children: [
                SizedBox(height: 20,),
              Icon(Icons.logout,size: 50,),
                   
              Center(child: Text("Logout"))
              
              ],),
              ),
            ),
          ),
      ],),)
      ),
    );
  }
}