// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';


// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

//   Color primaryColor = Color(0xff18203d);
//   Color secondaryColor = Color(0xff232c51);
//   Color logoGreen = Color(0xff25bcbb);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         margin: EdgeInsets.symmetric(horizontal: 40),
//         child: Column(children: [
//           Text(
//             'Sign in to TGD and continue',
//             textAlign: TextAlign.center,
//             style:
//             GoogleFonts.openSans(color: Colors.white, fontSize: 28),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Enter your email and password below to continue to the The Growing Developer and let the learning begin!',
//             textAlign: TextAlign.center,
//             style:
//             GoogleFonts.openSans(color: Colors.white, fontSize: 14),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           buildTextField('Email', Icons.account_circle),
//           SizedBox(height: 30),
//           buildTextField('Password', Icons.lock),

//           SizedBox(height: 30),
//           MaterialButton(
//             elevation: 0,
//             minWidth: double.maxFinite,
//             height: 50,
//             onPressed: () {},
//             color: logoGreen,
//             child: Text('Login',
//                 style: TextStyle(color: Colors.white, fontSize: 16)),
//             textColor: Colors.white,
//           ),
//           SizedBox(height: 20),
//           MaterialButton(
//             elevation: 0,
//             minWidth: double.maxFinite,
//             height: 50,
//             onPressed: () {
//               //Here goes the logic for Google SignIn discussed in the next section
//             },
//             color: Colors.blue,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Icon(FontAwesomeIcons.google),
//                 SizedBox(width: 10),
//                 Text('Sign-in using Google',
//                     style: TextStyle(color: Colors.white, fontSize: 16)),
//               ],
//             ),
//             textColor: Colors.white,
//           ),
//           SizedBox(height: 100),
//         ],),
//       ),


//     );
//   }


//   buildTextField(String labelText, IconData icon){
//     return Container(
//       //margin: EdgeInsets.symmetric(horizontal: 15),

//       decoration: BoxDecoration(
//         color: secondaryColor,
//         border: Border.all(color: Colors.blue),
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 10),
//             labelText: labelText,
//             labelStyle: TextStyle(color: Colors.white),
//             icon: Icon(
//               icon,
//               color: Colors.white,
//             ),
//             // prefix: Icon(icon),
//             border: InputBorder.none),

//       ),
//     );

//   }

// }

// onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (BuildContext context) => MyMedicine()));