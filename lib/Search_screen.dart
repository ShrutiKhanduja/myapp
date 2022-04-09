import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/research.dart';

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
  getData();

  getData1();
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
          emp_id: f['Emp_id'],
          emp_name: f['Emp_name'],
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
    height: MediaQuery.of(context).size.height * 0.75,
    child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: dogList.length,
    itemBuilder: (BuildContext, index) {
    var item = dogList[index];
    return InkWell(
    onTap: () async {
      

    },
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    width: MediaQuery.of(context).size.width * 0.8,
    child: Row(
    children: <Widget>[
    // Container(
    //   height: 50,
    //   width: 50,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(25),
    //     ),
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(25.0),
    //     child: CachedNetworkImage(
    //       height: 50,
    //       width: 50,
    //       imageUrl: item.url,
    //       imageBuilder: (context, imageProvider) =>
    //           Container(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //               image: imageProvider,
    //               fit: BoxFit.fill),
    //         ),
    //       ),
    //       placeholder: (context, url) => GFLoader(
    //         type: GFLoaderType.ios,
    //       ),
    //       errorWidget: (context, url, error) =>
    //           Icon(Icons.error),
    //     ),
    //   ),
    // ),
    Expanded(
    child: Padding(
    padding: const EdgeInsets.symmetric(
    horizontal: 20),
    child: Container(
    child: Text(
    '${item.domain_name} in ${item.title}',
    ),
    ),
    ),
    ),
    Icon(
    Icons.call_made_sharp,
    color: Colors.black,
    ),
    ],
    ),
    ),
    ),
    );
    },
    ),
    ),
    ),
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


        List<String> dogName = List<String>.from(f['nameSearch']);

        List<String> dogLowerCase = [];
        List<String> breedLowerCase = [];
        print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');

        for (var dog in dogName) {
          dogLowerCase.add(dog.toLowerCase());
        }

        if (dogLowerCase.contains(query.toLowerCase()) ||
            breedLowerCase.contains(query.toLowerCase())|| name.toLowerCase().toString().contains(query.toLowerCase())){


          print('Match found ${f['Domain_name']}');
          docList.add(f);

          dogList.add(  Research(
              doi:f['DOI'],
              domain_name: f['Domain_name'],
              emp_id: f['Emp_id'],
              emp_name: f['Emp_name'],
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
            emp_id: f['Emp_id'],
            emp_name: f['Emp_name'],
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
