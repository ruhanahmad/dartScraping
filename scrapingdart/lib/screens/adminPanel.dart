import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Addbrands extends StatefulWidget {
  

  const Addbrands({super.key});
  

  @override
  State<Addbrands> createState() => _AddbrandsState();
  
}



class _AddbrandsState extends State<Addbrands> {
  final _formKey = GlobalKey<FormState>();
File? _imageFile;
 String? _imageUrl;
String? namess;



Future getImage() async {
    if (_imageFile != null) {
      // Upload image to Firebase Storage
      Reference ref =
          FirebaseStorage.instance.ref().child('images/${DateTime.now().toString()}');
      UploadTask uploadTask = ref.putFile(_imageFile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Save image URL to Firestore
      FirebaseFirestore.instance.collection('brands').add({'image': downloadUrl,"name":namess});

      setState(() {
        _imageUrl = downloadUrl;
      });
    }
}


void _showDialog() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Add Item'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Brand NAme'),
              onChanged: (value) {
             namess  =   value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Brand Name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _imageFile != null
                ? Image.file(_imageFile!, height: 100)
                : SizedBox(height: 0),
            ElevatedButton(
              onPressed: () async {
                final pickedFile = await ImagePicker().getImage(
                  source: ImageSource.gallery,
                  imageQuality: 50,
                );
                if (pickedFile != null) {
                  setState(() {
                    _imageFile = File(pickedFile.path);
                  });
                }
              },
              child: Text('Add Image'),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: ()async {
            if (_formKey.currentState!.validate()) {
          await   getImage();
              Navigator.pop(context);
            }
          },
          child: Text('Save'),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     floatingActionButton: FloatingActionButton(
  onPressed: _showDialog,
  child: Icon(Icons.add),
),

body: Column(children: [


       StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('brands').snapshots(),
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
              String name = document['name'];
              String imageUrl = document['imageUrl'];

              return Card(
                child: Column(
                  children: [
                    Image.network(imageUrl),
                    Text(name),
                  ],
                ),
              );
            },
          );
        },
      ),

],),
    );
  }
}