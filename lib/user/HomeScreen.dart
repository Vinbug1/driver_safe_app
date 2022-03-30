import 'package:driver_safe_app/user/MapScreen.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreen createState()  => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xfffcdb0d),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:32),
                //padding: EdgeInsets.all(15.0),
                width: double.infinity,
               /* margin: EdgeInsets.only(
                    top: 120
                ),*/
                padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                  vertical: 35.0
                ),
                child: Center(
                    child: Image.asset("assets/images/taxi.jpg")
                ),
              ),
              SizedBox(height: 90.0,),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:const EdgeInsets.only(
                          top: 100
                      ),
                      child: Text(
                        "SafeCab",
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 81,
                          color: const Color(0xffae6602),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  /*  Center(
                      child: Text(
                        "Consult Your doctor with a click",
                        style: TextStyle(

                        ),
                      ),
                    ),*/
                  ],
                ),
              ),

              SizedBox(height: 60.0,),
              Container(
                child:GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(32),
                    padding: EdgeInsets.all(20.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child:Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            fontSize: 19.0,
                            color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
