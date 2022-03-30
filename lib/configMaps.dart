import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

String mapKey ="AIzaSyAhJ_IHhTFcbVSwkx787YMUbr6c_wInc0Q";


User firebaseUser;

//Users userCurrentInfo;

User currentfirebaseUser;

StreamSubscription<Position> homeTabStreamSubscription;