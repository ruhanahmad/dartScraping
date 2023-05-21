import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scrapingdart/AuthFirebase/auth.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.put(AuthService());
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.orange,
      ),
      body: 
      // StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance
      //       .collection('users')
          
      //       .snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     }

      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator();
      //     }

      //     return
      //      ListView.builder(
      //       itemCount: snapshot.data!.docs.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         DocumentSnapshot document = snapshot.data!.docs[index];
      //         String id = document.id;
      //         String name = document["name"];
      //         String description = document['email'];

              // return 
              Container(
                color: Colors.black,
                child: ListTile(
                
                  title: Text(authService.emailsss,style: TextStyle(color: Colors.orange),),
                   subtitle: Text(authService.namess,style: TextStyle(color: Colors.orange),),
                ),
              )
      //       },
      //     );
      //   },
      // ),
    );
  }
}
