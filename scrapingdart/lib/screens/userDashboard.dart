import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scrapingdart/main.dart';
import 'package:scrapingdart/screens/adminPanel.dart';
import 'package:scrapingdart/screens/homepage.dart';
import 'package:scrapingdart/screens/loginSigns.dart';
import 'package:scrapingdart/screens/mapGoogle.dart';
import 'package:scrapingdart/screens/userList.dart';
import 'package:scrapingdart/screens/userProfile.dart';



class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
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
  Text("Welcome to User Panel",style: TextStyle(color: Colors.white,fontSize: 20),),
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
         Get.to( UserProfile()) ;  
            },
            child: Container( 
              height: 220,
              width: 220,
            color: Colors.greenAccent,
            child: Column(children: [
  Icon(Icons.verified_user,size: 150,),
       
            Center(child: Text("Profile"))
            
            ],),
            ),
          ),
        
             GestureDetector(
            onTap: () {
             Get.to (MapViewGoogle ());
            },
            child: Container( 
              height: 220,
              width: 220,
            color: Colors.greenAccent,
            child: Column(children: [
  Icon(Icons.location_city,size: 150,),
       
            Center(child: Text("Discounts"))
            
            ],),
            ),
          ),
        ],),
        SizedBox(height: 20,),

           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
          GestureDetector(
            onTap: () {
              Get.to(FirebaseGridView());
            },
            child: Container( 
              height: 220,
              width: 220,
            color: Colors.greenAccent,
            child: Column(children: [
  Icon(Icons.branding_watermark,size: 150,),
       
            Center(child: Text("Discount Brands"))
            
            ],),
            ),
          ),
        
             GestureDetector(
            onTap: () async{
          await FirebaseAuth.instance.signOut();
   Get.to(LoginSigns());

            },
            child: Container( 
              height: 220,
              width: 220,
            color: Colors.greenAccent,
            child: Column(children: [
  Icon(Icons.logout,size: 150,),
       
            Center(child: Text("Logout"))
            
            ],),
            ),
          ),
        ],),




      ],),)
      ),
    );
  }
}