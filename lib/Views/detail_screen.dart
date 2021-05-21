import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;

  DetailedScreen({this.queryDocumentSnapshot});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatinActionButton(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Container(
        color: Color(0xFFF6F8FC),
        child: Column(
          children: [
            Flexible(flex: 2, child: topContainer()),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 8,
              child: bottomContainer(),
            ),
          ],
        ),
      )),
    );
  }

  Widget topContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 27),
          bottomRight: Radius.elliptical(50, 27),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[400],
            offset: Offset(0, 3.5),
          )
        ],
        color: Colors.deepPurple,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              top: 25,
              left: 45,
            ),
            child: Column(
              children: [
                Image.network(
                  widget.queryDocumentSnapshot['md_icon'],
                  height: 40,
                  width: 40,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              left: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.queryDocumentSnapshot['title'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        widget.queryDocumentSnapshot['strength'],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  widget.queryDocumentSnapshot['subtitle'],
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "By " + widget.queryDocumentSnapshot['manufactured_by'],
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(50, 27),
          topRight: Radius.elliptical(50, 27),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[400],
            offset: Offset(0, 3.5),
          )
        ],
        color: Colors.deepPurple[50],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Generic Name",
              style: TextStyle(
                fontFamily: "Angel",
                fontSize: 28,
                color: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                widget.queryDocumentSnapshot['generic_name'],
                style: TextStyle(
                    fontSize: 18.0, letterSpacing: 1.5, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Text(
              "Unit Price",
              style: TextStyle(
                fontFamily: "Angel",
                fontSize: 28,
                color: Colors.deepPurple,
              ),
            ),
            Row(
              children: [
                Icon(IconData(
                  0x09F3,
                  fontFamily: "Ic",
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 1.5),
                  child: Text(
                    widget.queryDocumentSnapshot['unit_price'] + " Taka",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Text(
              "Indications",
              style: TextStyle(
                fontFamily: "Angel",
                fontSize: 28,
                color: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                widget.queryDocumentSnapshot["indications"],
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Text(
              "Side Effects",
              style: TextStyle(
                fontFamily: "Angel",
                fontSize: 28,
                color: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                widget.queryDocumentSnapshot["side_effects"],
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget floatinActionButton() {
    return Container(
      height: 70,
      width: 250,
      child: Material(
        borderRadius: BorderRadius.circular(50),
        color: Colors.deepPurple, // button color
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          splashColor: Colors.white, // splash color
          onTap: () {
            addUserMyMedicineList();
          }, // button pressed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.local_hospital,
                size: 50,
              ), // icon
              Text(
                "Add to My Medicine",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ), // text
            ],
          ),
        ),
      ),
    );
  }

  bool isLoggedIn() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addUserMyMedicineList() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    firestoreInstance
        .collection("UserItems")
        .doc(firebaseUser.uid)
        .collection('MyMedicine')
        .doc(widget.queryDocumentSnapshot.id)
        .set({
      "title": widget.queryDocumentSnapshot['title'],
      "subtitle": widget.queryDocumentSnapshot['subtitle'],
      "md_icon ": widget.queryDocumentSnapshot['md_icon'],
      "generic_name": widget.queryDocumentSnapshot['generic_name'],
      "strength": widget.queryDocumentSnapshot['strength'],
      "manufactured_by": widget.queryDocumentSnapshot['manufactured_by'],
      "unit_price": widget.queryDocumentSnapshot['unit_price'],
      "indications": widget.queryDocumentSnapshot['indications'],
      "side_effects": widget.queryDocumentSnapshot['side_effects'],
    }).catchError((e) {
      print(e);
    });
  }
}
