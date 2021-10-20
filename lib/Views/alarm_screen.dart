import 'package:drugboxappv1/Services/auth_service.dart';
import 'package:drugboxappv1/Views/add_new_alarm.dart';
import 'package:drugboxappv1/Views/slideBar.dart';
import 'package:drugboxappv1/widgets/provider_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class AlarmScreen extends StatefulWidget {
  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
       drawer: SlideBar(),
      // backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Center(child: Text('Medicine Alarm')),
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
        color: Color(0xFFF6F8FC),
        child: BottomContainer(),
        // Column(
        //   children: [
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Flexible(flex: 2, child: TopContainer()),
        //     // SizedBox(
        //     //   height: 10,
        //     // ),
        //     Flexible(
        //       flex: 8,
        //       child: BottomContainer(),
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
       
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          var firebaseUser = FirebaseAuth.instance;

              if (firebaseUser.currentUser != null) {
                return Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddAlarm()));
              } else {
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text("Please login first"),
                    duration: Duration(seconds: 3),));
               
              }
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         child: AddAlarm(), type: PageTransitionType.fade));
        },
      ),
    );
  }
}

// class TopContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.elliptical(50, 27),
//           bottomRight: Radius.elliptical(50, 27),
//           topRight: Radius.elliptical(50, 27),
//           topLeft: Radius.elliptical(50, 27),
//         ),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 5,
//             color: Colors.grey[400],
//             offset: Offset(0, 3.5),
//           )
//         ],
//         color: Colors.deepPurple,
//       ),
//       width: double.infinity,
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               bottom: 10,
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "Medicine",
//                   style: TextStyle(
//                     fontFamily: "Angel",
//                     fontSize: 32,
//                     color: Colors.white,
//                     letterSpacing: 1.5,
//                   ),
//                 ),
//                 Text(
//                   "Alarm",
//                   style:TextStyle(
//                     fontSize: 32,
//                     color: Colors.white,
//                     letterSpacing: 1.5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

      child: Column(
        children: [
          Text("New Alarm"),
          Expanded(child: ListView()),
        ],
      ),
    );
  }
}
