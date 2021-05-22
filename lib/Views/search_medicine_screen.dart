import 'package:drugboxappv1/Helpers/Headers.dart';
import 'package:flutter/material.dart';


class SearchMedicine extends StatefulWidget {
  @override
  _SearchMedicineState createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {
  TextEditingController searchController = TextEditingController();
  // Future resultsLoaded;
  // List altResults = [];

  // @override
  // void initState() {
  //   super.initState();
  //   searchController.addListener(onSearchChanged);
  // }

  // @override
  // void dispose() {
  //   searchController.removeListener(onSearchChanged);
  //   searchController.dispose();
  //   super.dispose();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   resultsLoaded = getMedicineDocs();
  // }

  // onSearchChanged() {
  //   print(searchController.text);
  // }

  // getMedicineDocs() async {
  //   final uid = await Provider.of(context).auth.getCurrentUID();
  //   var data = await FirebaseFirestore.instance.collection('medicine').get();
  //   setState(() {
  //     altResults = data.docs;
  //   });
  //   return "complete";
  // }

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
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Write medicine name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => searchController.clear(),
                    )),
              ),
              SizedBox(height: 10,),
              

              // Headers().searchBar(context),
              Headers().medicineList(context, 'medicine'),
            ],
          ),
        ),
      ),
    );
  }
}
