import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:myapp/research.dart';
import 'package:myapp/search_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<Research> dogList1 = [];
  List<Widget> dogCardsList1 = [];

  List<DocumentSnapshot> docList = [];
  List<Research> dogList = [];
   SharedPreferences? prefs=null;
  void pref()async {
    prefs= await SharedPreferences.getInstance();

  }



  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController(text: "");
  Widget appBarTitle = Text(
  'Search',
  style: GoogleFonts.openSans(
  fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
  );
  Icon actionIcon = new Icon(Icons.search);

  int number = 0;
  int max = 10;

  @override
  void initState() {
    pref();




  getData();

  getData1();
  }
  List<List<dynamic>> rows = [];
  downloadData() {
    rows.clear();
    List titles=['author','domain','paperLink','title','doi'];
    rows.add(titles);
    for (int i = 0; i < dogList.length; i++) {

      List<dynamic> row = [];

      row.add(dogList[i].author);
      row.add(dogList[i].domain_name);
      row.add(dogList[i].paper_link);
      row.add(dogList[i].title);
      row.add(dogList[i].doi);
      rows.add(row);

    }

    String csv = const ListToCsvConverter().convert(rows);
    new AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
      ..setAttribute("download", "data.csv")
      ..click();
  }

  void getData1() async {
  dogCardsList1.clear();
  dogList1.clear();
  print('started loading');
  await FirebaseFirestore.instance
      .collection("data")
      .get()
      .then((QuerySnapshot snapshot) {
  snapshot.docs.forEach((f) async {




   dogList.add(
      Research(
          doi:f['DOI'],
          domain_name: f['Domain_name'],

          author: f['Author'],
          paper_link: f['Paper_link'],
          title: f['title'],
          keywords: f['keywords']
      )
  );
  // await dogCardsList1.add(MyDogCard(dp, width, height));
  print('Dog added');

  });
  });
  setState(() {
  print(dogList1.length.toString());
  print(dogCardsList1.length.toString());
  });
  }


  List<Widget> dogCardsList = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
      actions: <Widget>[],
      centerTitle: true,
      title: new TextFormField(

        controller:searchController,
        decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,

          ),
          hintText: 'Search here',
          hintStyle: GoogleFonts.poppins(

        ),
        ),
        onChanged: (String query) {
          getCaseDetails(query);
        },
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(),
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: dogList.length,
                itemBuilder: (BuildContext, index) {
                  var item = dogList[index];
                  return InkWell(
                    onTap: ()  {
                      launch(item.paper_link);

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Search_cards(doi: item.doi,author: item.author,title: item.title,paper_link: item.paper_link,),
                    ),
                  );
                },
              ),
            ),

          ),
          (prefs?.getString('Admin')=='true')?InkWell(
            onTap:(){
              setState(() {
              downloadData();
              });


            },
            child: Container(
                height: SizeConfig.deviceHeight*0.06,
                width:SizeConfig.deviceWidth*0.95,
                decoration: BoxDecoration(
                    color:HexColor("#227BBC"),
                    borderRadius: BorderRadius.all((Radius.circular(10)))
                ),
                child:Center(child: Text('Export data',style:GoogleFonts.montserrat(color:Colors.white,fontSize:SizeConfig.deviceHeight*0.02,fontWeight: FontWeight.bold)))
            ),
          ):Container(),
        ],
      ),
    ),
    );
  }

  getCaseDetails(String query) async {
    docList.clear();
    dogList.clear();
    setState(() {
      print('Updated');
    });

    if (query == '') {
      print(query);
      getData();
      return;
    }

    await FirebaseFirestore.instance
        .collection('data')
        .get()
        .then((QuerySnapshot snapshot) {
      docList.clear();
      dogList.clear();
      snapshot.docs.forEach((f) {
        var name = f['Domain_name'].toString().toLowerCase();
        List array=f['keywords'];


        List<String> dogName = List<String>.from(f['nameSearch']);

        List<String> dogLowerCase = [];
        List<String> breedLowerCase = [];
        print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');

        for (var dog in dogName) {
          dogLowerCase.add(dog.toLowerCase());
        }

        if (dogLowerCase.contains(query.toLowerCase()) || array.toString().trim().contains(query)||
            breedLowerCase.contains(query.toLowerCase())|| name.toLowerCase().toString().contains(query.toLowerCase())){


          print('Match found ${f['Domain_name']}');
          docList.add(f);

          dogList.add(  Research(
              doi:f['DOI'],
              domain_name: f['Domain_name'],

              author: f['Author'],
              paper_link: f['Paper_link'],
              title: f['title'],
              keywords: f['keywords']
          ));
          setState(() {
            print('Updated');
          });
        }
      });
    });
  }


  void getData() async {
    await FirebaseFirestore.instance
        .collection("data")
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) {

        dogList.add(  Research(
            doi:f['DOI'],
            domain_name: f['Domain_name'],

            author: f['Author'],
            paper_link: f['Paper_link'],
            title: f['title'],
            keywords: f['keywords']
        ));

      });
    });
    setState(() {
      print(dogList.length.toString());
    });
  }
}

