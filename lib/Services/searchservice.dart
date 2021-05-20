    
import 'package:cloud_firestore/cloud_firestore.dart';
final firestoreInstance = FirebaseFirestore.instance;
class SearchService {
  searchByName(String searchField) {
    return firestoreInstance
        .collection('medicine')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .get();
  }
}