import 'dart:async';
import 'package:driver_safe_app/main.dart';
import 'package:driver_safe_app/user/RegisterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../configMaps.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState()  =>  _HomeState();
}

@override
class _HomeState<StatefulWidget>  extends State<Home> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  Position currentPosition;
  var geoLocator =  Geolocator();

  String driverStatusText = "Offline Now";
  Color  driverStatusColor = Colors.blue;
  bool isDriverAvailable = false;


  static final CameraPosition initialLocation = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
  );
  void locatePosition() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng  latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(target: latLatPosition,zoom: 14);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    // String address = await  AssistantMethods.searchCoordinateAddress(position,context);
    // print("This is your Address ::" + address);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          initialCameraPosition:initialLocation,
          myLocationButtonEnabled: true,
          /*
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,*/
          onMapCreated: (GoogleMapController controller){
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;
            locatePosition();
          },
        ),
        //online offline driver container

        Positioned(
          top: 60.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            crossAxisAlignment:  CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  color: driverStatusColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    driverStatusText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: (){
                    if(isDriverAvailable != true)
                    {
                      makeDriverOnlineNow();
                      getLocationLiveUpdates();

                      setState(() {
                        driverStatusColor = Colors.yellow;
                        driverStatusText = "Online";
                        isDriverAvailable = true;

                      });
                        displayToastMessage("You are Online now", context);
                    }
                    else
                      {

                      setState(() {
                        driverStatusColor = Colors.blue;
                        driverStatusText = "Offline Now - Go Online";
                        isDriverAvailable = false;
                      });
                      makeDriverOffline();

                      displayToastMessage("You are Offline now", context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  void makeDriverOnlineNow() async
  {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    Geofire.initialize("availableDrivers");
    Geofire.setLocation(currentfirebaseUser.uid, currentPosition.latitude, currentPosition.longitude);

    rideRequestRef.onValue.listen((event){

    });
  }

  void getLocationLiveUpdates()
  {
    homeTabStreamSubscription = Geolocator.getPositionStream().listen((Position position) {
      currentPosition = position;
      if(isDriverAvailable == true)
      {
        Geofire.setLocation(currentfirebaseUser.uid, position.latitude, position.longitude);
      }
      LatLng latLng = LatLng(position.latitude, position.longitude);
      newGoogleMapController.animateCamera(CameraUpdate.newLatLng(latLng));
    });
  }

  void makeDriverOffline(){
    Geofire.removeLocation(currentfirebaseUser.uid);
    rideRequestRef.onDisconnect();
    rideRequestRef.remove();
    rideRequestRef = null;
  }
}



