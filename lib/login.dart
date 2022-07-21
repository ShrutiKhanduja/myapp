import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
// String obj='{"Sheet2": [{"Name": "Kanchan","Department": "FET","Email_id": "kanchan.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "abhilasha","Department": "FET","Email_id": "abhilasha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "abhiruchi","Department": "FET","Email_id": "abhiruchi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Aftab","Department": "FET","Email_id": "aftab.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "akkaushik","Department": "FET","Email_id": "akkaushik.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "alumni","Department": "FET","Email_id": "alumni.fetmriu2@mrei.ac.in","Password": "1234","role": "user"},{"Name": "alumni","Department": "FET","Email_id": "alumni.fetmriu@mrei.ac.in","Password": "1234","role": "user"},{"Name": "alumni","Department": "FET","Email_id": "alumni.fetmriu1@mrei.ac.in","Password": "1234","role": "user"},{"Name": "amana","Department": "FET","Email_id": "amana.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "amanpreet","Department": "FET","Email_id": "amanpreet.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "amitatri","Department": "FET","Email_id": "amitatri.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "amitbhardwaj","Department": "FET","Email_id": "amitbhardwaj.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "amrinder","Department": "FET","Email_id": "amrinder.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Anil Kumar","Department": "FET","Email_id": "anil.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Anisha","Department": "FET","Email_id": "anisha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "anitakhosla","Department": "FET","Email_id": "anitakhosla.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "anitasharma","Department": "FET","Email_id": "anitasharma.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "anjaligupta","Department": "FET","Email_id": "anjaligupta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "anuj","Department": "FET","Email_id": "anuj.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "anupama","Department": "FET","Email_id": "anupama.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "anupamagarg","Department": "FET","Email_id": "anupamagarg.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Arko","Department": "FET","Email_id": "arko.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "artisaxena","Department": "FET","Email_id": "artisaxena.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "arun","Department": "FET","Email_id": "karun.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "arun","Department": "FET","Email_id": "arun.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Arunangshu","Department": "FET","Email_id": "arunangshu.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "arunk","Department": "FET","Email_id": "arunk.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Ashish","Department": "FET","Email_id": "ashishsaxena.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ashishgrover","Department": "FET","Email_id": "ashishgrover.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ashutoshkumar","Department": "FET","Email_id": "ashutoshkumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Associate Dean","Department": "FET","Email_id": "associatedean.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Atulya","Department": "FET","Email_id": "atulyakumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Baljeet","Department": "FET","Email_id": "baljeet.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Basanta Kumar","Department": "FET","Email_id": "bkbhuyan.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "bharatmunjal","Department": "FET","Email_id": "bharatmunjal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "binod","Department": "FET","Email_id": "bksingh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Brijesh","Department": "FET","Email_id": "brijesh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "bsgill","Department": "FET","Email_id": "bsgill.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "charu","Department": "FET","Email_id": "charu.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "COL. SACHIN","Department": "FET","Email_id": "sachinmarwah.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "CSE","Department": "FET","Email_id": "cse.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "DAIN D.","Department": "FET","Email_id": "ddthomas.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Dean","Department": "FET","Email_id": "dean.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "deepa","Department": "FET","Email_id": "deepa.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "deepakkhurana","Department": "FET","Email_id": "deepakkhurana.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "deepakkumar","Department": "FET","Email_id": "deepakkumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "devdutt","Department": "FET","Email_id": "devdutt.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Devender","Department": "FET","Email_id": "devendersingh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "devendra","Department": "FET","Email_id": "devendra.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Devinder","Department": "FET","Email_id": "devindersingh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "dineshchawla","Department": "FET","Email_id": "dineshchawla.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "director","Department": "FET","Email_id": "director.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "DR. DEBASHIS","Department": "FET","Email_id": "debashis.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Dr. Pallavi","Department": "FET","Email_id": "pallavi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "drdevisingh","Department": "FET","Email_id": "drdevisingh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ed","Department": "FET","Email_id": "ed.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "FET","Department": "FET","Email_id": "fetmagazine@mrei.ac.in","Password": "1234","role": "user"},{"Name": "FET, VINOD","Department": "FET","Email_id": "vinod.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "gagandeep","Department": "FET","Email_id": "gagandeep.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "geeta","Department": "FET","Email_id": "geeta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Gurpreet","Department": "FET","Email_id": "gurpreet.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Gurvinder","Department": "FET","Email_id": "gurvinder.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Haobam","Department": "FET","Email_id": "haobam.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "hkpal","Department": "FET","Email_id": "hkpal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "HOD","Department": "FET","Email_id": "hodbiotech.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ikkilam","Department": "FET","Email_id": "ikkilam.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "indu","Department": "FET","Email_id": "indu.fet@mriu.edu.in","Password": "1234","role": "admin"},{"Name": "jagpal","Department": "FET","Email_id": "jagpal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Jayant","Department": "FET","Email_id": "jayant.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "JIMMY","Department": "FET","Email_id": "jimmy.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "JOYDEEP","Department": "FET","Email_id": "joydeep.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Jyoti","Department": "FET","Email_id": "jyotisharma.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "jyoti","Department": "FET","Email_id": "jyoti.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "jyotiverma","Department": "FET","Email_id": "jyotiverma.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "K. P Shahi","Department": "FET","Email_id": "kpshahi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Kamlesh","Department": "FET","Email_id": "kamlesh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Kanwar","Department": "FET","Email_id": "kanwar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "kapil","Department": "FET","Email_id": "kapil.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Kapila","Department": "FET","Email_id": "kapila.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "kapilparmar","Department": "FET","Email_id": "kapilparmar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "kesav","Department": "FET","Email_id": "kesav.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Keshav","Department": "FET","Email_id": "keshav.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "krishan","Department": "FET","Email_id": "krishan.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "krishankumar","Department": "FET","Email_id": "krishankumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Krishna","Department": "FET","Email_id": "krishna.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "kritikasoni","Department": "FET","Email_id": "kritikasoni.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "kuldeep","Department": "FET","Email_id": "kuldeep.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Kumarmukesh","Department": "FET","Email_id": "kumarmukesh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "kumarsatish","Department": "FET","Email_id": "kumarsatish.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "leenag","Department": "FET","Email_id": "leenag.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "librarian","Department": "FET","Email_id": "librarian.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Madhulika","Department": "FET","Email_id": "madhulikacse.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Madhulika","Department": "FET","Email_id": "madhulika.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "madhumita","Department": "FET","Email_id": "madhumita.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "mandeep","Department": "FET","Email_id": "mandeep.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Manisha","Department": "FET","Email_id": "manisha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "manojnayak","Department": "FET","Email_id": "manojnayak.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "meeta","Department": "FET","Email_id": "meeta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Meghna","Department": "FET","Email_id": "meghna.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Mithilesh","Department": "FET","Email_id": "mithilesh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "monika","Department": "FET","Email_id": "monika.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "monikagarg","Department": "FET","Email_id": "monikagarg.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "neeraj","Department": "FET","Email_id": "solanki.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "neerajkumari","Department": "FET","Email_id": "neerajkumari.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "neerajlamba","Department": "FET","Email_id": "neerajlamba.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "nehabatra","Department": "FET","Email_id": "nehabatra.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "nehachaudhary","Department": "FET","Email_id": "nehachaudhary.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "nehagarg","Department": "FET","Email_id": "nehagarg.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "nehasethi","Department": "FET","Email_id": "nehasethi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Nidhi","Department": "FET","Email_id": "nidhigarg.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "nidhididwania","Department": "FET","Email_id": "nidhididwania.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Nikita","Department": "FET","Email_id": "nikita.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Nitasha","Department": "FET","Email_id": "nitasha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "nitinwaghmare","Department": "FET","Email_id": "nitinwaghmare.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "opbhatia","Department": "FET","Email_id": "opbhatia.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Osama","Department": "FET","Email_id": "osamatasneemfetece@mriu.edu.in","Password": "1234","role": "user"},{"Name": "pankajshakkarwal","Department": "FET","Email_id": "pankajshakkarwal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Parsanta","Department": "FET","Email_id": "parsanta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "parularora","Department": "FET","Email_id": "parularora.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "pinki","Department": "FET","Email_id": "pinki.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "pooja","Department": "FET","Email_id": "pooja.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Poonam","Department": "FET","Email_id": "poonamtanwar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "poonamkatyal","Department": "FET","Email_id": "poonamkatyal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "poonamnandal","Department": "FET","Email_id": "poonamnandal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Pradeep","Department": "FET","Email_id": "pradeep.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "pradeepsharma","Department": "FET","Email_id": "pradeepsharma.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "prashant","Department": "FET","Email_id": "prashant.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "PRATEEK","Department": "FET","Email_id": "prateekmittal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "pratima","Department": "FET","Email_id": "pratima.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Preeti","Department": "FET","Email_id": "preetisharma.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Preeti","Department": "FET","Email_id": "preetinandal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "preeti","Department": "FET","Email_id": "preeti.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "prerna","Department": "FET","Email_id": "prerna.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "priyaaggarwal","Department": "FET","Email_id": "priyaaggarwal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "priyankagrover","Department": "FET","Email_id": "priyankagrover.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Pronika","Department": "FET","Email_id": "pronika.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "rachna","Department": "FET","Email_id": "rachna.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "rachnabhel","Department": "FET","Email_id": "rachnabhel.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "rajeevkumar","Department": "FET","Email_id": "rajeevkumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "rajender","Department": "FET","Email_id": "rajender.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Rajesh","Department": "FET","Email_id": "rajesh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Rajesh","Department": "FET","Email_id": "rksharma.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "rakeshkumar","Department": "FET","Email_id": "rakeshkumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ram","Department": "FET","Email_id": "ram.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Ramesh","Department": "FET","Email_id": "rcsahoo.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ramvir","Department": "FET","Email_id": "ramvir.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ranjeet","Department": "FET","Email_id": "ranjeet.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ranjeeta","Department": "FET","Email_id": "ranjeeta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Rashima","Department": "FET","Email_id": "rashima.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "rashmi","Department": "FET","Email_id": "rashmi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Richa","Department": "FET","Email_id": "richaadlakha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "rkumar","Department": "FET","Email_id": "rkumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "romisha","Department": "FET","Email_id": "romisha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Rosy","Department": "FET","Email_id": "rosymadaan.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "rubysingh","Department": "FET","Email_id": "rubysingh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "S. Varadharajan","Department": "FET","Email_id": "svaradharajan.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "sabiha","Department": "FET","Email_id": "sabiha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Sadiqa","Department": "FET","Email_id": "sadiqa.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Sandeep","Department": "FET","Email_id": "sandeep.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Sanjay","Department": "FET","Email_id": "sanjaygupta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "sanjaybansal","Department": "FET","Email_id": "sanjaybansal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Sarika","Department": "FET","Email_id": "sarika.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "sarvesh","Department": "FET","Email_id": "sarvesh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "savita","Department": "FET","Email_id": "savita.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "scnarula","Department": "FET","Email_id": "scnarula.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Seema","Department": "FET","Email_id": "seemamahto.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Shagufta","Department": "FET","Email_id": "shagufta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Shailesh","Department": "FET","Email_id": "shaileshsingh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shanti","Department": "FET","Email_id": "shanti.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Shashank","Department": "FET","Email_id": "shashank.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "SHASHI","Department": "FET","Email_id": "shashitiwari.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shashikant","Department": "FET","Email_id": "shashikant.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shavetamalik","Department": "FET","Email_id": "shavetamalik.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shefali","Department": "FET","Email_id": "shefali.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shelja","Department": "FET","Email_id": "shelja.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Shivam","Department": "FET","Email_id": "shivam.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shobha","Department": "FET","Email_id": "shobhatyagi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Shobha","Department": "FET","Email_id": "tyagishobha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shradha","Department": "FET","Email_id": "shradha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "SHRISTI","Department": "FET","Email_id": "shristi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shrrirup","Department": "FET","Email_id": "spnambiar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shruti","Department": "FET","Email_id": "shruti.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Shubhangi","Department": "FET","Email_id": "shubhangi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shweta","Department": "FET","Email_id": "shweta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Shweta","Department": "FET","Email_id": "shwetamongia.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "shyamlal","Department": "FET","Email_id": "shyamlal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "simple","Department": "FET","Email_id": "simple.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Sneha","Department": "FET","Email_id": "sneharai.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "solankimanu","Department": "FET","Email_id": "solankimanu.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "SONAL","Department": "FET","Email_id": "sonal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Sonali","Department": "FET","Email_id": "sonalibatra.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Sonia","Department": "FET","Email_id": "sonia.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "srishty","Department": "FET","Email_id": "srishty.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "ssrivastava","Department": "FET","Email_id": "ssrivastava.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "sujitroy","Department": "FET","Email_id": "sujitroyfetbcs046@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Sunita","Department": "FET","Email_id": "sunitabansal.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "sunny","Department": "FET","Email_id": "sunny.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Supriya P.","Department": "FET","Email_id": "supriya.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Surbhi","Department": "FET","Email_id": "surbhi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "suresh","Department": "FET","Email_id": "suresh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "sushant1","Department": "FET","Email_id": "sushant1.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "sushma","Department": "FET","Email_id": "sushma.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "TANVI","Department": "FET","Email_id": "tanvigupta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Tapas","Department": "FET","Email_id": "tapaskumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "umeshdutta","Department": "FET","Email_id": "umeshdutta.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Usha","Department": "FET","Email_id": "usha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "vasudha","Department": "FET","Email_id": "vasudha.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Vijay","Department": "FET","Email_id": "vijaykumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Vijay","Department": "FET","Email_id": "vijaysingh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Vikas","Department": "FET","Email_id": "vikaskumar.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "vikassrivastav","Department": "FET","Email_id": "vikassrivastav.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "vimlesh","Department": "FET","Email_id": "vimlesh.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "vinay","Department": "FET","Email_id": "vinay.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Virender","Department": "FET","Email_id": "virender.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Vishal","Department": "FET","Email_id": "vishalantil.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Vishnu","Department": "FET","Email_id": "vishnuraj.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Yaman","Department": "FET","Email_id": "yaman.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "YOGENDRA","Department": "FET","Email_id": "ykawasthi.fet@mriu.edu.in","Password": "1234","role": "user"},{"Name": "Zeeshan","Department": "FET","Email_id": "zeeshan.fet@mriu.edu.in","Password": "1234","role": "user"}]}';
// List<Add>allusers=[];


  // for email text field controller
  final TextEditingController _emailcontroller = TextEditingController();
  late SharedPreferences prefs;
  void pref()async {
    prefs= await SharedPreferences.getInstance();

  }
void add(){


     FirebaseFirestore.instance.collection('Users').get().then((value) {
       print(value.docs.length);
     });


   }



  // for password text field controller
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isHiddenPassword = true;
  late FocusNode _myFocusNodeEmail;
  late FocusNode _myFocusNodePassword;
  void checkUser(){
    FirebaseFirestore.instance.collection('Users').where('email_id',isEqualTo: _emailcontroller.text).where('password',isEqualTo:_passwordcontroller.text).get().then((value) {
      if(value.docs.isEmpty){
        Fluttertoast.showToast(
                        msg: 'Invalid Credentials',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 12.0);
      }
      else{
        for (var element in value.docs) {
          if(element['role']=='user'){
            prefs.setString('Admin','false');
          }
          else{
            prefs.setString('Admin', 'true');
          }
        }

      }

    });
  }
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
                          prefs.setString('isLogged', 'true');
                          checkUser();
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
                    // InkWell(
                    //   onTap:(){
                    //     setState(() {
                    //
                    //     });
                    //
                    //
                    //   },
                    //
                    //   child: Container(
                    //     height: SizeConfig.deviceHeight*0.06,
                    //     width:SizeConfig.deviceWidth*0.95,
                    //     decoration: BoxDecoration(
                    //         color:Colors.grey,
                    //         borderRadius: BorderRadius.all((Radius.circular(10)))
                    //     ),
                    //     child: ElevatedButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.google,color: Colors.red), label: Text("LOGIN WITH GOOGLE ",style:GoogleFonts.montserrat(color:Colors.white,fontSize:SizeConfig.deviceHeight*0.02,fontWeight: FontWeight.bold)),
                    //       style: ElevatedButton.styleFrom(
                    //           primary: HexColor("#d3d3d3"),
                    //           onPrimary: Colors.white,
                    //           minimumSize: Size(double.infinity,SizeConfig.deviceHeight*0.06)
                    //       ),
                    //     ),
                    //   ),
                    // ),

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
class Add{
  late  String name;
  late String email_id;
  late String department;
  late String role;
  late String password;
  Add({required this.name,required this.email_id,required this.department,required this.password,required this.role});
}