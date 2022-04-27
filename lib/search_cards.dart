import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/research.dart';

import 'Search_screen.dart';
class Search_cards extends StatefulWidget {
 String doi,title,paper_link,author;
Search_cards({required this.doi,required this.title,required this.paper_link,required this.author});
  @override
 
  State<Search_cards> createState() => _Search_cardsState();
}

class _Search_cardsState extends State<Search_cards> {


  @override

  Widget build(BuildContext context) {
SizeConfig().init(context);
    return Container(
      width: SizeConfig.deviceWidth*0.8,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Row(
                  children: [

                    Text('DOI : ',style:GoogleFonts.signika(color:Color.fromRGBO(4, 22, 48, 0.7),fontSize: SizeConfig.deviceHeight*0.02,fontWeight: FontWeight.bold),),
                    Text(widget.doi,style:GoogleFonts.signika(color:Colors.grey,fontSize: SizeConfig.deviceHeight*0.02)),
                  ],
                ),
                Row(
                  children: [
                    Text('TITLE : ',style:GoogleFonts.signika(color:Color.fromRGBO(4, 22, 48, 0.7),fontSize: SizeConfig.deviceHeight*0.02,fontWeight: FontWeight.bold),),
                    Expanded(child: Text(widget.title,overflow:TextOverflow.ellipsis,style:GoogleFonts.signika(color:Colors.grey,fontSize: SizeConfig.deviceHeight*0.02))),
                  ],
                ),
                // Row(
                //   children: [
                //     // Text('EMP ID : ',style:GoogleFonts.signika(color:Color.fromRGBO(4, 22, 48, 0.7),fontSize: SizeConfig.deviceHeight*0.02,fontWeight: FontWeight.bold),),
                //     // Text(widget.emp_id,style:GoogleFonts.signika(color:Colors.grey,fontSize: SizeConfig.deviceHeight*0.02)),
                //   ],
                // ),
                Row(
                  children: [
                    Text('AUTHOR_NAME : ',style:GoogleFonts.signika(color:Color.fromRGBO(4, 22, 48, 0.7),fontSize: SizeConfig.deviceHeight*0.02,fontWeight: FontWeight.bold),),
                    Text(widget.author,style:GoogleFonts.signika(color:Colors.grey,fontSize: SizeConfig.deviceHeight*0.02),),

                  ],
                ),



              ]
          ),
        ),
      ),
    );
  }
}

