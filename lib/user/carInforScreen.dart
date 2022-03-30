import 'package:driver_safe_app/configMaps.dart';
import 'package:driver_safe_app/user/LicenseDetails.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'RegisterScreen.dart';

class CarInforScreen extends StatelessWidget {

  final TextEditingController carNameController = TextEditingController();
  final TextEditingController carMakeController = TextEditingController();
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController carStatusController = TextEditingController();
  final TextEditingController carNumberController = TextEditingController();
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
                        controller: carNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Please enter Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                          ),
                          //prefixIcon: Icon(Icons.person, color: Colors.black,)
                        ),
                      ),

                      SizedBox(height: 10.0,),
                      TextField(
                        controller: carMakeController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "car make",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),

                        ),
                      ),

                      SizedBox(height: 10.0,),
                      TextField(
                        controller: carModelController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "car Model",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.black,)
                        ),

                      ),

                      SizedBox(height: 10.0,),
                      TextField(
                        controller: yearController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Manufactured date",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),
                        ),
                      ),

                      SizedBox(height: 10.0,),
                      TextField(
                        controller: carNumberController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: " please enter car number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                          ),
                        ),
                      ),

                      SizedBox(height: 10.0,),
                      TextField(
                        controller: carStatusController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "please enter car status",
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
                          if(carNameController.text.isEmpty) {
                            displayToastMessage("carName can not empty",context);
                          }
                          else if(carMakeController.text.isEmpty){
                            displayToastMessage("car make can not be  empty",context);
                          }
                          else if(carModelController.text.isEmpty){
                            displayToastMessage("car model can not be empty ",context);
                          }
                          else if(yearController.text.isEmpty) {
                            displayToastMessage("car manufactured year can not be empty", context);
                          }
                          else if(carNumberController.text.length < 11 || carNumberController.text.isEmpty) {
                            displayToastMessage(" Password must be atLest 6 character", context);
                          }
                          else {
                            registerNewCar(context);
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

  void registerNewCar(BuildContext context) {
    String userId = currentfirebaseUser .uid;
    Map carDataMap = {
      'carName' : carNameController.text.trim(),
      'carModel' : carModelController.text.trim(),
      'carMake' : carMakeController.text.trim(),
      'year': yearController.text.trim(),
      'carNumber' : carNumberController.text.trim(),
      'status' : carStatusController.text.trim(),
    };
      driversRef.child(userId).child("car_details").set(carDataMap);
    displayToastMessage(" your car detail is saved successfully ", context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LicenseDetailScreen())
    );
  }
}
