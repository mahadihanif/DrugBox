// import 'package:flutter/material.dart';

// class MultipleNotifire extends ChangeNotifier {
//   List<String> _selectItems;
//   MultipleNotifire(this._selectItems);
//   List<String> get selectedItems => _selectItems;

//   bool isHaveItem(String value) => _selectItems.contains(value);

//   addItem(String value) {
//     if (!isHaveItem(value)) {
//       _selectItems.add(value);
//       notifyListeners();
//     }
//   }

//   removeItem(String value) {
//     if (isHaveItem(value)) {
//       _selectItems.remove(value);
//       notifyListeners();
//     }
//   }
// }
