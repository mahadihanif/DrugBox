import 'dart:collection';

import 'package:drugboxappv1/Views/detail_screen2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

import 'detail_screen.dart';

class MyMedicine extends StatefulWidget {
  @override
  _MyMedicineState createState() => _MyMedicineState();
}

class _MyMedicineState extends State<MyMedicine> {
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Medicine')),
        backgroundColor: Colors.deepPurple,
        actions: [
          Center(child: Text("+1")),
          IconButton(icon: Icon(Icons.notifications), onPressed: () => {}),
        ],
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          null,
          0,
        ),
      ),
      body: Container(
          child: StreamBuilder(
        stream: getUsersMedicineList(context),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              color: Color(0xFFF6F8FC),
              child: Center(
                child: Text(
                  "Please Log in first!.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFC9C9C9),
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else if (snapshot.data.docs.length == 0) {
            return Container(
              color: Color(0xFFF6F8FC),
              child: Center(
                child: Text(
                  "Medicine List is empty!\n add new one.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFC9C9C9),
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else {
            return new ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildMyMedicineCard(context, snapshot.data.docs[index]));
          }
        },
      )),
    );
  }

  Stream<QuerySnapshot> getUsersMedicineList(BuildContext context) async* {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser.uid != null) {
      yield* firestoreInstance
          .collection("UserItems")
          .doc(firebaseUser.uid)
          .collection("MyMedicine")
          .snapshots();
    } else {
      print('Please Login first');
    }
  }

  Widget buildMyMedicineCard(
      BuildContext context, DocumentSnapshot medicineList) {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: DetailedScreen2(
                      queryDocumentSnapshot: medicineList.data[index],
                    ),
                    type: PageTransitionType.fade));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Text(
                            medicineList['title'],
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            medicineList['strength'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                var firebaseUser =
                                    FirebaseAuth.instance.currentUser;
                                firestoreInstance
                                    .collection("UserItems")
                                    .doc(firebaseUser.uid)
                                    .collection("MyMedicine")
                                    .doc(medicineList.id)
                                    .delete()
                                    .then((_) {
                                  print("success!");
                                });
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Text(
                            "By " + medicineList['manufactured_by'],
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Text(
                            medicineList['generic_name'],
                            style: TextStyle(fontSize: 18.0),
                          ),
                          // Text(
                          //   medicineList.id,
                          //   style: TextStyle(fontSize: 18.0),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
