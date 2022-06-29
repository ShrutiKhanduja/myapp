import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/HomeScreen.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // for email text field controller
  final TextEditingController _emailcontroller = TextEditingController();
  late SharedPreferences prefs;
  void pref()async {
    prefs= await SharedPreferences.getInstance();
  }

  // for password text field controller
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isHiddenPassword = true;
  late FocusNode _myFocusNodeEmail;
  late FocusNode _myFocusNodePassword;
  @override
  void initState() {
    super.initState();
    pref();

    _myFocusNodeEmail = FocusNode();
    _myFocusNodeEmail.addListener(() {
      setState(() {});
    });

    _myFocusNodePassword = FocusNode();
    _myFocusNodePassword.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _myFocusNodeEmail.removeListener(() {});
    _myFocusNodeEmail.dispose();

    _myFocusNodePassword.removeListener(() {});
    _myFocusNodePassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:SizeConfig.deviceHeight*0.06),
              Column(
                  children:[


                    SizedBox(height:SizeConfig.deviceHeight*0.03),
                    Center(
                      child: Text('WELCOME TO MRIIRS RESEARCH EXPLORER',style:GoogleFonts.montserrat(color:HexColor("#227BBC"),fontSize: SizeConfig.deviceHeight*0.035,fontWeight: FontWeight.bold


                      )),
                    ),
                    SizedBox(height:SizeConfig.deviceHeight*0.06),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40,8,40,8),
                      child: TextFormField(
                        controller:_emailcontroller,
                        cursorColor:Color.fromRGBO(4, 22, 48, 1),
                        focusNode: _myFocusNodeEmail,
                        decoration: InputDecoration(

                          contentPadding: EdgeInsets.only(bottom: 5,left: 15),
                          labelText: "EMAIL",
                          prefixIcon: Icon(Icons.email,color:_myFocusNodeEmail.hasFocus?Color.fromRGBO(4, 22, 48, 1):Colors.grey ,),
                          border: OutlineInputBorder(),
                          labelStyle: GoogleFonts.
                          montserrat(color:Colors.black,fontSize: SizeConfig.deviceHeight*0.03,fontWeight: FontWeight.bold),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter Your Email",
                          hintStyle: GoogleFonts.
                          montserrat(color:Colors.grey,fontSize: SizeConfig.deviceHeight*0.022),
                          helperStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),

                        validator: (val) {
                          if (val?.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.montserrat(),
                      ),
                    ),
                    SizedBox(height:SizeConfig.deviceHeight*0.02),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40,8,40,8),
                      child: TextFormField(

                        controller: _passwordcontroller,
                        obscureText: isHiddenPassword,
                        cursorColor: Color.fromRGBO(4, 22, 48, 1),
                        focusNode: _myFocusNodePassword,
                        decoration: InputDecoration(

                          contentPadding: EdgeInsets.only(bottom: 5,left: 15),
                          labelText: "PASSWORD",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock,color:_myFocusNodePassword.hasFocus?Color.fromRGBO(4, 22, 48, 1):Colors.grey ,),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isHiddenPassword = !isHiddenPassword;
                                });
                              },
                              child: isHiddenPassword?(Icon(Icons.visibility_off,color:_myFocusNodePassword.hasFocus?Color.fromRGBO(4, 22, 48, 1):Colors.grey )):(Icon(Icons.visibility,color:_myFocusNodePassword.hasFocus?Color.fromRGBO(4, 22, 48, 1):Colors.grey ))
                          ),
                          labelStyle: GoogleFonts.
                          montserrat(color:Colors.black,fontSize: SizeConfig.deviceHeight*0.03,fontWeight: FontWeight.bold),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter Your Password",
                          hintStyle: GoogleFonts.
                          montserrat(color:Colors.grey,fontSize: SizeConfig.deviceHeight*0.022),
                          helperStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,

                          ),
                        ),

                        validator: (val) {
                          if (val?.length == 0) {
                            return "Password cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.montserrat(),
                      ),
                    ),
                    SizedBox(height:SizeConfig.deviceHeight*0.04),
                    InkWell(
                      onTap:(){
                        setState(() {
                          prefs.setString('name', _emailcontroller.text);
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen()));

                      },
                      child: Container(
                          height: SizeConfig.deviceHeight*0.06,
                          width:SizeConfig.deviceWidth*0.95,
                          decoration: BoxDecoration(
                              color:HexColor("#227BBC"),
                              borderRadius: BorderRadius.all((Radius.circular(10)))
                          ),
                          child:Center(child: Text('LOGIN',style:GoogleFonts.montserrat(color:Colors.white,fontSize:SizeConfig.deviceHeight*0.02,fontWeight: FontWeight.bold)))
                      ),
                    ),
                    SizedBox(height:SizeConfig.deviceHeight*0.04),
                    InkWell(
                      onTap:(){
                        setState(() {

                        });


                      },

                      child: Container(
                        height: SizeConfig.deviceHeight*0.06,
                        width:SizeConfig.deviceWidth*0.95,
                        decoration: BoxDecoration(
                            color:Colors.grey,
                            borderRadius: BorderRadius.all((Radius.circular(10)))
                        ),
                        child: ElevatedButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.google,color: Colors.red), label: Text("LOGIN WITH GOOGLE ",style:GoogleFonts.montserrat(color:Colors.white,fontSize:SizeConfig.deviceHeight*0.02,fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              primary: HexColor("#d3d3d3"),
                              onPrimary: Colors.white,
                              minimumSize: Size(double.infinity,SizeConfig.deviceHeight*0.06)
                          ),
                        ),
                      ),
                    ),

                  ]
              ),
              SizedBox(height:SizeConfig.deviceHeight*0.05),
              Stack(children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/Group 34.png')),
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('assets/Group41.png')),
              ],)


            ],
          ),
        )
    );
  }
}
