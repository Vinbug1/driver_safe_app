import 'package:driver_safe_app/user/MapScreen.dart';
import 'package:flutter/material.dart';

import '../configMaps.dart';
import '../main.dart';
import 'RegisterScreen.dart';

class LicenseDetailScreen extends StatelessWidget {
  final TextEditingController issueDateController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController renewalDateController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 22.0,),
              Image.asset("assets/images/taxi.jpg", width: 390.0,height: 250.0),
              Padding(
                padding: EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 32.0),
                child: Column(
                  children: [
                    SizedBox(height: 12.0,),
                    Text("Enter car details", style: TextStyle(fontFamily: "Brand-Bold",fontSize: 24.0),),

                    SizedBox(height: 26.0,),
                    TextField(
                      controller: issueDateController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Please enter license issue date",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        //prefixIcon: Icon(Icons.person, color: Colors.black,)
                      ),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: expiryDateController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "expiry date",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),

                      ),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: renewalDateController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "renewal date",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                          ),
                          prefixIcon: Icon(Icons.email, color: Colors.black,)
                      ),

                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: passportController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "passport",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: statusController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "license status",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),

                    SizedBox(height: 42.0),
                    RaisedButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {
                        if(issueDateController.text.isEmpty) {
                          displayToastMessage("license date can not empty",context);
                        }
                        else if(expiryDateController.text.isEmpty){
                          displayToastMessage("license date can not be  empty",context);
                        }
                        else if(renewalDateController.text.isEmpty){
                          displayToastMessage("license date can  not be empty ",context);
                        }
                        else if(passportController.text.isEmpty) {
                          displayToastMessage("please add recent passport", context);
                        }
                        else if(statusController.text.isEmpty) {
                          displayToastMessage("License can be empty", context);
                        }
                        else {
                          registerCarLicense(context);
                        }
                      },
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text('SignUp',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ), shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerCarLicense(BuildContext context) {
    String userId = currentfirebaseUser .uid;
    Map licenseDataMap = {
      'issueDate' : issueDateController.text.trim(),
      'expiryDate' : expiryDateController.text.trim(),
      'renewalDate' : renewalDateController.text.trim(),
      'passport' : passportController.text.trim(),
      'status' : statusController.text.trim(),
    };
    driversRef.child(userId).child("license_details").set(licenseDataMap);
    displayToastMessage(" your license details is saved successfully ", context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapScreen())
    );
  }
}
