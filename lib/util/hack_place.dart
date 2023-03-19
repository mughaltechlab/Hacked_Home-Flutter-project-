// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HackingPlace extends StatelessWidget {
  final String myHackingPlaceName;
  final iconPath;
  final bool isHacked;
  void Function(bool)? onChanged;
  HackingPlace({
    super.key,
    required this.myHackingPlaceName,
    required this.iconPath,
    required this.isHacked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: BoxDecoration(
          color: isHacked ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.red,
                offset: isHacked ? Offset(2, 2) : Offset(0, 0)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Icon(
                iconPath,
                size: 60,
                color: isHacked ? Colors.deepOrange : Colors.deepPurple,
              ),
              // placeName + swith
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      myHackingPlaceName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: isHacked
                            ? Colors.deepOrange
                            : Colors.deepPurpleAccent,
                      ),
                    ),
                    Transform.rotate(
                        angle: pi / 2,
                        child: CupertinoSwitch(
                            activeColor: Colors.deepOrange,
                            value: isHacked,
                            onChanged: onChanged)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: isHacked
                    ? Text('Hacked',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))
                    : Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
