import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QueryData extends StatefulWidget {

  final QueryDocumentSnapshot queryDocumentSnapshot;

  QueryData({this.queryDocumentSnapshot});

  @override
  _QueryDataState createState() => _QueryDataState();
}

class _QueryDataState extends State<QueryData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}