import 'package:driver_safe_app/configMaps.dart';
import 'package:driver_safe_app/user/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dataHandler/appData.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   currentfirebaseUser = FirebaseAuth.instance.currentUser;
  runApp(MyApp());
}
 DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
DatabaseReference driversRef = FirebaseDatabase.instance.reference().child("drivers");
DatabaseReference rideRequestRef = FirebaseDatabase.instance.reference().child("drivers").child(currentfirebaseUser.uid).child("newRide");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Safe Cab',
        theme: ThemeData(

          primarySwatch: Colors.amber,
        ),
        home: HomeScreen(),
       debugShowCheckedModeBanner: false,
      ),
    );
  }
}

