import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  final String text;

  const HomeScreen({Key? key, required this.text}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Stack(
          children: [

            Image.asset('assets/back.png',fit: BoxFit.cover,width:MediaQuery.of(context).size.width),
            Align(
                alignment:Alignment.bottomLeft,

                child: Column(
                  children:  [
                    SizedBox(height:MediaQuery.of(context).size.height*0.45 ),
                    Image.asset('assets/Rectangle 10.png',height: MediaQuery.of(context).size.height*0.5,),
                  ],
                )),
            Align(
                alignment:Alignment.bottomLeft,

                child: Column(
                  children:  [
                    SizedBox(height:MediaQuery.of(context).size.height*0.55 ),
                    Image.asset('assets/Rectangle 4.png',height: MediaQuery.of(context).size.height*0.5,),
                  ],
                )),
            Align(
                alignment:Alignment.bottomRight,

                child: Image.asset('assets/s2.png',height: MediaQuery.of(context).size.height*0.7,)),
            Align(
              alignment:Alignment.bottomRight,

                child: Image.asset('assets/s1.png',height: MediaQuery.of(context).size.height*0.8,)),
            Column(
              children:[
                SizedBox(height:MediaQuery.of(context).size.height*0.1,),
                Center(child: Text('SEARCH YOUR RESEARCH',style:GoogleFonts.coda(color:Color.fromRGBO(0,33, 72, 1),fontSize:MediaQuery.of(context).size.height*0.08))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Container(
            height: 70,
            margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(

              style: TextStyle(fontSize: 25),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                icon: Icon(Icons.search, color: Colors.black),
                suffixIcon: widget.text.isNotEmpty
                    ? GestureDetector(
                  child: Icon(Icons.close,color: Colors.black54),
                  onTap: () {


                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
                    : null,
                hintText: "Search or Type a Url",

                border: InputBorder.none,
              ),


            ),
          ),
        ),
                SizedBox(height:MediaQuery.of(context).size.height*0.1,),
                Center(child: Text('Amet minim  molit non deserunt ullomco \n est sit aliqua dolor do amet sint. Velit officia \n consequat duis enim velit molit.',style:GoogleFonts.questrial(color:Color.fromRGBO(0,33, 72, 1),fontSize:MediaQuery.of(context).size.height*0.04))),
                SizedBox(height:MediaQuery.of(context).size.height*0.1,),
        Image.asset('assets/mr.png'
        ),
                SizedBox(height:MediaQuery.of(context).size.height*0.1 ),
                Center(child: Text('An initiative by Manav Rachna International institiute of reseach and Studies', style: GoogleFonts.sourceSansPro(
                    fontSize:  MediaQuery.of(context).size.height*0.05,
                    letterSpacing: 1.6),)),

                SizedBox(height:MediaQuery.of(context).size.height*0.1 ),
                Stack(
                  children: [
                    Container(
                      height: 200,
                      color: HexColor("#B0C4DE"),
                    ),
                    Row(children: [


                      Expanded(

                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: InkWell(

                              child: Text(
                                'GET IN TOUCH \n Mrie Campus \n Sector-43, Aravalli Hills,Delhi- \n Surajkhund Road Faridabad-121004,\n (Haryana),India',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize:  MediaQuery.of(context).size.height*0.0175,
                                    letterSpacing: 1.6),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top:50.0),
                            child: InkWell(
                              child: Text(
                                'GENERAL ENQUIRY \n MRIIRS:+91-129-4198000,4198100 \n Fax +91-129-4198211 \n Email: admissions@manavrachna.edu.net',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize:  MediaQuery.of(context).size.height*0.0175,
                                    letterSpacing: 1.6),
                              ),
                              onTap: () {

                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top:50.0),
                            child: InkWell(
                              child: Text(
                                'CITY OFFICES \n Chandigrah|Delhi|Guwahati| \n Indore| Kota| Lucknow|Varanasi|\n Patna|Hyderabad\n c Manav Rachna Vidyantariksha.All \n Right Reserved',
                                 style: GoogleFonts.sourceSansPro(
fontSize:  MediaQuery.of(context).size.height*0.0175,
                                    letterSpacing: 1.6),
                              ),
                              onTap: () {

                              },
                            ),
                          ),
                        ),
                      ),
                    ],),
              ]


            ),

          ],
        ),
  ]),
      )
    );
  }
}
