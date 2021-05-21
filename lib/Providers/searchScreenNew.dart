// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(
//             "Search Medicine",
//             style: TextStyle(fontSize: 20),
//           ),
//           TextField(
//             controller: searchController,
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: 'Write medicine name',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () => searchController.clear(),
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
