import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Records'),
        backgroundColor: Colors.orange,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
          
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              String id = document.id;
              String name = document["name"];
              String description = document['email'];

              return Dismissible(
                key: Key(id),
                onDismissed: (direction) {
                  FirebaseFirestore.instance
                      .collection('users')
                     .doc(id)
                      .delete();
                },
                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete),
                    alignment: Alignment.centerRight,
                  ),
                ),
                child: Container(
                  color: Colors.black,
                  child: ListTile(
                  
                    title: Text(name,style: TextStyle(color: Colors.orange),),
                    subtitle: Text(description,style: TextStyle(color: Colors.orange),),
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
