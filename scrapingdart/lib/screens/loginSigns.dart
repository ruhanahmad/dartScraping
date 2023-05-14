import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapingdart/screens/adminLogin.dart';
import 'package:scrapingdart/screens/login.dart';
import 'package:scrapingdart/screens/loginOnly.dart';
import 'package:scrapingdart/screens/signup.dart';



class LoginSigns extends StatefulWidget {
  const LoginSigns({super.key});

  @override
  State<LoginSigns> createState() => _LoginSignsState();
}

class _LoginSignsState extends State<LoginSigns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(child:
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/oop.png'))),),
                Text("Nav Discount",style: TextStyle(color: Colors.white,),),
                SizedBox(height: 170,),
                Column(
  children: [
    ElevatedButton(
      
      onPressed: () {
     Get.to(LoginScreen());
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        onPrimary: Colors.white,
        minimumSize: Size(150, 40)
      ),
      child: Text('Login'),
    ),

    ElevatedButton(
      onPressed: () {
      
       Get.to(SignUp());

      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        onPrimary: Colors.white,
         minimumSize: Size(150, 40)
      ),
      child: Text('Sign up'),
    ),

        ElevatedButton(
      onPressed: () {
      
       Get.to(AdminLoginScreen());

      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        onPrimary: Colors.white,
         minimumSize: Size(150, 40)
      ),
      child: Text('Admin Login'),
    ),
  ],
)

            ],
          ),
        ),
      
      ),
    );
  }
}