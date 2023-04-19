import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scrapingdart/AuthFirebase/auth.dart';
import 'package:scrapingdart/breakout.dart';
import 'package:scrapingdart/screens/alkaram.dart';
import 'package:scrapingdart/screens/gulahmad.dart';
import 'package:scrapingdart/screens/khaadi.dart';
import 'package:scrapingdart/screens/limelight.dart';

import 'package:scrapingdart/screens/mapGoogle.dart';
import 'package:scrapingdart/screens/mariab.dart';
import 'package:scrapingdart/screens/outfitters.dart';
import 'package:scrapingdart/screens/sanasafinaz.dart';
import 'package:scrapingdart/screens/sapphire.dart';
import 'package:url_launcher/url_launcher.dart';


class FirebaseGridView extends StatefulWidget {
  @override
  _FirebaseGridViewState createState() => _FirebaseGridViewState();
}

class _FirebaseGridViewState extends State<FirebaseGridView> {
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('brands').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.put(AuthService());
    return Scaffold(
      appBar: AppBar(
       
        title: Text('Brands'),
        actions: [
          ElevatedButton(
      onPressed: () {
        authService.signOut();
        Navigator.pop(context);
      },
      child: const Text('Logout'),
    ),
              ElevatedButton(
      onPressed: () {
        // authService.signOut();
        Get.to (MapViewGoogle ());
        // Navigator.pop(context);
      },
      child: const Text('MapView'),
    ),
   
        ElevatedButton(
      onPressed: ()async {
        // authService.signOut();
     Get.to ( Alkaram  ());
  //  await  scrapeData();
        // Navigator.pop(context);
      },
      child: const Text('Checking'),
    ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
            
          }
           if (snapshot.hasError){
                  print(snapshot.hasError);
             } 

          return GridView.builder(
            itemCount: snapshot.data!.docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;

              return GestureDetector(
                onTap: () {
                  // Handle button click here
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                         Get.to(CardProductWrapperList(name:data["name"]));
                        },
                        child: Text('Button'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
