import 'package:drugboxappv1/Views/medicineList.dart';
import 'package:drugboxappv1/Views/search_medicine_screen.dart';
import 'package:flutter/material.dart';
import 'package:drugboxappv1/Views/my_medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:drugboxappv1/Views/login_screen.dart';
import 'package:page_transition/page_transition.dart';

class SlideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/NavBarCover4.jpg'),
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10.0,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/flutterIcon.png",
                          width: 80,
                          height: 80,
                        ),
                      )),
                  SizedBox(height: 8.0),
                  Text(
                    "DrugBox",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.deepPurple,
            onTap: () => {},
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              title: Text("Account"),
            ),
          ),
          InkWell(
            splashColor: Colors.amberAccent,
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: SearchMedicine(),
                      type: PageTransitionType.rightToLeft));
            },
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text("Search Medicine"),
            ),
          ),
          InkWell(
            splashColor: Colors.amberAccent,
            child: ListTile(
              leading: Icon(Icons.medical_services_sharp),
              title: Text("My Medicine"),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyMedicine()));
            },
          ),
          Divider(),
          InkWell(
            splashColor: Colors.amberAccent,
            onTap: () => {},
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ),
          InkWell(
            splashColor: Colors.amberAccent,
            onTap: () => {},
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
            ),
          ),
          Divider(),
          InkWell(
            splashColor: Colors.amberAccent,
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit"),
            ),
            onTap: () async {
              await _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
