import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:drugboxappv1/Views/login_screen.dart';
// import 'package:drugboxappv1/screens/my_medicine.dart';
import 'package:drugboxappv1/Views/slideBar.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:drugboxappv1/grid_dashBoard.dart';
//import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SlideBar(),
      // backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Center(child: Text('Medicine | DrugBox')),
        backgroundColor: Colors.deepPurple,
        actions: [
          Center(child: Text("+1")),
          IconButton(icon: Icon(Icons.notifications), onPressed: () => {}),
        ],
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30.0),bottomRight: Radius.circular(30.0),),
          ),
          null,
          0,
        ),
      ),
     

//home Screen Body Start.....
      body: 
      
      DashBoard(),

      

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}

