import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugboxappv1/models/medicine.dart';
import 'package:drugboxappv1/widgets/provider_widget.dart';

class FirebaseService {

  // static Future<Medicine> getNextTrip(context) async {
  //   final uid = Provider.of(context).auth.getCurrentUID();
  //   var snapshot = await FirebaseFirestore.instance
  //       .collection('medicine')
  //       .doc(uid)
  //       .collection('trips')
  //       .orderBy('startDate')
  //       .limit(1)
  //       .get();
  //   return Medicine.fromSnapshot(snapshot.docs.first);
  // }

  // static void addToLedger(context, documentId, item) async {
  //   await Provider.of(context).db
  //       .collection('userData')
  //       .doc(Provider.of(context).auth.getCurrentUID())
  //       .collection('trips')
  //       .doc(documentId)
  //       .update(item);
  // }
}