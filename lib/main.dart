import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/HomeScreen.dart';
import 'package:myapp/login.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized(

  );
  await Firebase.initializeApp(
    options:  FirebaseOptions(
    apiKey: "AIzaSyDWxf5bvF_rPHmGVFW2JDP1wI3lJnmSA58",
    appId: "1:713376671130:web:42499ecb8eaab38b36c623",
    messagingSenderId: "713376671130",
    projectId: "research-a7e88",
  ),
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   final Future< FirebaseApp> _initialization =Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            print("Error");
            print(snapshot.error);
          }
          if(snapshot.connectionState==ConnectionState.done){
            print("Done");
            return LoginScreen();
          }
          return CircularProgressIndicator();
        },


      )
    );
  }
}
