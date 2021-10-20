import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugboxappv1/Services/auth_service.dart';
import 'package:drugboxappv1/Views/slideBar.dart';
import 'package:drugboxappv1/models/medicine.dart';
import 'package:drugboxappv1/widgets/medicine_card.dart';
import 'package:drugboxappv1/widgets/provider_widget.dart';
import 'package:flutter/material.dart';

class SearchMedicine extends StatefulWidget {
  @override
  _SearchMedicineState createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _altResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getMedicineDocs();
  }

  _onSearchChanged() {
    searchResultsList();
    // print(_searchController.text);
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController != "") {
      for (var medicineSnapshot in _altResults) {
        var title = Medicine.fromSnapshot(medicineSnapshot).title.toLowerCase();

        if (title.contains(_searchController.text.toLowerCase())) {
          showResults.add(medicineSnapshot);
        }
      }
    } else {
      showResults = List.from(_altResults);
    }

    setState(() {
      _resultsList = showResults;
    });
  }

  getMedicineDocs() async {
    // final uid = await Provider.of(context).auth.getCurrentUID();
    var data = await FirebaseFirestore.instance.collection('medicine').get();
    setState(() {
      _altResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         drawer: SlideBar(),
      // backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Center(child: Text('Medicine | DrugBox')),
        backgroundColor: Colors.green[600],
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print (e);
              }
            },
          )
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

        body: Container(
          color: Color(0xFFF6F8FC),
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Write medicine name (ex. Napa)",
                  suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () => _searchController.clear(),)
                  ),
              ),
              SizedBox(height: 10.0,),
              Expanded(
                child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildMedicineCard(context, _resultsList[index]),
                ),
              )
            ],
          ),
        ));

    
  }
}
