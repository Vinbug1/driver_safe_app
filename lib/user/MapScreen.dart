import 'package:driver_safe_app/configMaps.dart';
import 'package:driver_safe_app/tabsPages/earningsTabPage.dart';
import 'package:driver_safe_app/tabsPages/homeTabPage.dart';
import 'package:driver_safe_app/tabsPages/profileTabPage.dart';
import 'package:driver_safe_app/tabsPages/ratingTabPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with SingleTickerProviderStateMixin {
  TabController  tabController;
  int selectedIndex = 0;

  void onItemClicked(int index){
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            Home(),
            Earning(),
            Rating(),
            Profile()
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem
            (
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem
            (
            icon: Icon(Icons.credit_card),
            label: "Earning",
          ),
          BottomNavigationBarItem
            (
            icon: Icon(Icons.star),
            label: "Ratings",
          ),
          BottomNavigationBarItem
            (
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.yellow,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12.0),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }


}
