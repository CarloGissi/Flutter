import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydevice_flutter/page/filter_page.dart';
import 'package:mydevice_flutter/page/home_page.dart';
import 'package:mydevice_flutter/page/preferiti_page.dart';

class MyNevBar extends StatefulWidget {

  @override
  _MyNevBarState createState() => _MyNevBarState();
}

class _MyNevBarState extends State<MyNevBar>
{
  int currentIndex = 0;
  final screens = [
    HomePage(),
    PreferitiPage(),
    FilterPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Preferiti'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.filter_list_sharp),
            title: Text('Filtri'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.lightGreenAccent,
          ),
        ],
      ),
    );

  }
}