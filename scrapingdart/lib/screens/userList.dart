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
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('records')
            .where('userId', isEqualTo: user!.uid)
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
              String description = document['description'];

              return Dismissible(
                key: Key(id),
                onDismissed: (direction) {
                  FirebaseFirestore.instance
                      .collection('records')
                      .doc(id)
                      .delete();
                },
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete),
                  alignment: Alignment.centerRight,
                ),
                child: ListTile(
                  title: Text(name),
                  subtitle: Text(description),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
