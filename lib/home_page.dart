// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacked_home/util/hack_place.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list myHackingPlaces
  List myHackingPlaces = [
    // [hackingPlaceName, iconPath, isHacked]
    ['Room1', Icons.meeting_room_outlined, true],
    ['Room2', Icons.meeting_room_outlined, false],
    ['Room3', Icons.meeting_room_outlined, false],
    ['Room4', Icons.meeting_room_outlined, false],
    ['Doors', Icons.door_sliding_outlined, false],
    ['Camera', Icons.camera_indoor_outlined, true],
  ];

  // hacked switch changed
  void hackSwitchChanged(bool value, int index) {
    setState(() {
      myHackingPlaces[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade100,
        title: Text(
          'Hacked Home',
          style: GoogleFonts.bebasNeue(
            color: Colors.black,
            fontSize: 24,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: false,
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Control House',
              style: GoogleFonts.babylonica(
                fontSize: 40,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemCount: myHackingPlaces.length,
              itemBuilder: (BuildContext context, int index) {
                return HackingPlace(
                  myHackingPlaceName: myHackingPlaces[index][0],
                  iconPath: myHackingPlaces[index][1],
                  isHacked: myHackingPlaces[index][2],
                  onChanged: (value) => hackSwitchChanged(value, index),
                );
              },
            ),
          ),
        ],
      ),

      // bottom curved navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(8, 245, 245, 245),
        color: Colors.deepPurple.shade200,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 32.0,
          ),
          Icon(
            Icons.done_all_outlined,
            color: Colors.white,
            size: 32.0,
          ),
          Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32.0,
          ),
        ],
      ),
    );
  }
}
