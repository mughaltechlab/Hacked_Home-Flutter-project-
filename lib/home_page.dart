// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
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
    );
  }
}
