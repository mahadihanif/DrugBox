import 'package:drugboxappv1/Helpers/Headers.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchMedicine extends StatefulWidget {
  @override
  _SearchMedicineState createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Center(child: Text('Search Medicine | DrugBox')),
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
      
      

      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Headers().searchBar(context),
              Headers().medicineList(context, 'medicine'),
            ],
          ),
        ),
      ),
    );
  }
}
