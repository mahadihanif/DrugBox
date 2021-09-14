import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:travel_budget/credentials.dart';


class Medicine {
  String title;
  String subtitle;
  String unit_price;
  String strength;
  String side_effects;
  String md_icon;
  String manufactured_by;
  String indications;
  String id;
  String generic_name;
  



  Medicine(
      this.title,
      this.subtitle,
      this.unit_price,
      this.strength,
      this.side_effects,
      this.md_icon,
      this.manufactured_by,
      this.indications,
      this.id,
      this.generic_name,
      );

  // formatting for upload to Firbase when creating the trip
  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'unit_price': unit_price,
    'strength': strength,
    'side_effects': side_effects,
    'md_icon': md_icon,
    'manufactured_by': manufactured_by,
    'indications': indications,
    'id': id,
    'generic_name': generic_name,
  };

  // creating a Trip object from a firebase snapshot
  Medicine.fromSnapshot(DocumentSnapshot snapshot) :
      title = snapshot['title'],
      subtitle = snapshot['subtitle'],
      unit_price = snapshot['unit_price'],
      strength = snapshot['strength'],
      side_effects = snapshot['side_effects'],
      md_icon = snapshot['md_icon'],
      manufactured_by = snapshot['manufactured_by'],
      indications = snapshot['indications'],
      id = snapshot.id,
      generic_name = snapshot['generic_name'];



  // Map<String, Icon> types() => {
  //   "car": Icon(Icons.directions_car, size: 50),
  //   "bus": Icon(Icons.directions_bus, size: 50),
  //   "train": Icon(Icons.train, size: 50),
  //   "plane": Icon(Icons.airplanemode_active, size: 50),
  //   "ship": Icon(Icons.directions_boat, size: 50),
  //   "other": Icon(Icons.directions, size: 50),
  // };

 
  
}