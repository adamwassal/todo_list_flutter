import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class Counter extends StatelessWidget {
  int all;
  int allcomplated;
  Counter({super.key, required this.all, required this.allcomplated});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        '$allcomplated/$all',
        style: TextStyle(
          color: allcomplated == all ? Colors.green : Colors.white,
          fontSize: 44,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
