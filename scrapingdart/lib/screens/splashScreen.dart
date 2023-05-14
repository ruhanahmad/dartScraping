import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scrapingdart/screens/login.dart';
import 'package:scrapingdart/screens/loginSigns.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
          ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>  LoginSigns())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child:
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/oop.png'))),),
                Text("Nav Discount",style: TextStyle(color: Colors.white,),)
            ],
          ),
        ),
      ),
    );
  }
}