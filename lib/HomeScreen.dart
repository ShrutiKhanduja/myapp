import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              alignment:Alignment.bottomRight,
                child: Image.asset('assets/s1.png',height: MediaQuery.of(context).size.height*0.5,)),
            Column(
              children:[
                SizedBox(height:MediaQuery.of(context).size.height*0.1,),
                Center(child: Text('SEARCH YOUR RESEARCH',style:GoogleFonts.coda(color:Color.fromRGBO(0,33, 72, 1),fontSize:MediaQuery.of(context).size.height*0.08))),
              ]


            ),

          ],
        ),
      )
    );
  }
}
