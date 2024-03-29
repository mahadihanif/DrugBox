import 'package:drugboxappv1/Services/auth_service.dart';
import 'package:drugboxappv1/Views/medicineList.dart';
import 'package:drugboxappv1/Views/search_medicine_screen.dart';
import 'package:drugboxappv1/Views/myMedicineDetailedScreen.dart';
import 'package:drugboxappv1/widgets/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

import 'slideBar.dart';

class MyMedicine extends StatefulWidget {
  @override
  _MyMedicineState createState() => _MyMedicineState();
}

class _MyMedicineState extends State<MyMedicine> {
  final firestoreInstance = FirebaseFirestore.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
       drawer: SlideBar(),
      appBar: AppBar(
        title: Center(child: Text('My Medicine')),
        backgroundColor: Colors.green[600],
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print (e);
              }
            },
          )
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
        builder: (BuildContext context,AsyncSnapshot snapshot) {
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
      
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          var firebaseUser = FirebaseAuth.instance;

              if (firebaseUser.currentUser != null) {
                return Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchMedicine()));
              } else {
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text("Please login first"),
                    duration: Duration(seconds: 3),));
               
              }
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         child: SearchMedicine(), type: PageTransitionType.fade));
        },
      ),
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
      BuildContext context, QueryDocumentSnapshot medicineList) {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {

            
            Navigator.push(
                context,
                PageTransition(
                    child: DetailedScreen1(queryDocumentSnapshot:medicineList), type: PageTransitionType.fade));
            
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
                              icon: Icon(Icons.delete,color: Colors.red,),
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
