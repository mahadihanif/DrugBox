import 'package:drugboxappv1/Views/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:drugboxappv1/Services/ManageData.dart';

class Headers extends ChangeNotifier {
 TextEditingController searchController  = TextEditingController();

  Widget searchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 0, 2, 8.0),
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
                    onPressed: () => searchController.clear(),)),
          ),
        ],
      ),
    );
  }

  Widget medicineList(BuildContext context, String collection) {
    return Container(
      height: 700,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SizedBox(
              height: 50,
              width: 50,
              child: Lottie.asset('assets/Animations/loading.json'),
            ));
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                splashColor: Colors.deepPurple,
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: DetailedScreen(
                              queryDocumentSnapshot: snapshot.data[index]),
                          type: PageTransitionType.fade));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(
                            snapshot.data[index].data()['md_icon'],
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            snapshot.data[index].data()['subtitle'],
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
                              snapshot.data[index].data()['title'],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                snapshot.data[index].data()['strength'],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        Text(
                          snapshot.data[index].data()['generic_name'],
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            snapshot.data[index].data()['manufactured_by'],
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
              );
            },
          );
        },
      ),
    );
  }
}
