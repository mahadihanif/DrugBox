import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugboxappv1/Views/detail_screen.dart';
import 'package:drugboxappv1/models/medicine.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


Widget buildMedicineCard(BuildContext context, DocumentSnapshot document) {
  final medicine = Medicine.fromSnapshot(document);
  // final medicineType = medicine.types();

  return new Container(
    child: Card(
      child: InkWell(
        splashColor: Colors.deepPurple,
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: DetailedScreen(
                              medicine:medicine
                              ),
                          type: PageTransitionType.fade));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            if (medicine.subtitle !=
                                "Capsule")
                              Image.asset(
                                "assets/images/round_tablets.png",
                                height: 30,
                                width: 30,
                              )
                            else
                              Image.asset(
                                "assets/images/capsule.png",
                                height: 30,
                                width: 30,
                              ),
     
                              //If database have a image column

                            // Image.network(
                            //   snapshot.data[index].data()['md_icon'],
                            //   height: 30,
                            //   width: 30,
                            // ),

                            
                            Text(
                              medicine.subtitle,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                medicine.title,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  medicine.strength,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          Text(
                            medicine.generic_name,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              medicine.manufactured_by,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

        
        // onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => DetailedScreen(trip: trip)),
          // );
        // },
      ),
    ),
  );
}