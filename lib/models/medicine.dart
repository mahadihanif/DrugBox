import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine {
  String title;
  String subtitle;
  String generic_name;
  String strength;
  String manufactured_by;
  String unit_price;
  String indications;
  String side_effects;

  Medicine(
      this.title,
      this.subtitle,
      this.generic_name,
      this.strength,
      this.manufactured_by,
      this.unit_price,
      this.indications,
      this.side_effects);

  Medicine.fromSnapshot(DocumentSnapshot snapshot)
      : title = snapshot['title'],
        subtitle = snapshot['subtitle'],
        generic_name = snapshot['generic_name'],
        strength = snapshot['strength'],
        manufactured_by = snapshot['manufactured_by'],
        unit_price = snapshot['unit_price'],
        indications = snapshot['indications'],
        side_effects = snapshot['side_effects'];

  Map<String, Icon> types() =>
      {"tablet": Icon(Icons.tab), "capsule": Icon(Icons.casino_sharp)};
}
