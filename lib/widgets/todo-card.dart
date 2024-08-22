// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDoCard extends StatelessWidget {
  final String title;
  final bool state;
  final Function change;
  final Function delete;
  final int iii;

  const ToDoCard({
    super.key,
    required this.title,
    required this.state,
    required this.change,
    required this.delete,
    required this.iii,
  });
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title',
              style: TextStyle(
                  color: state ? Colors.black : Colors.white,
                  fontSize: 22,
                  decoration:
                      state ? TextDecoration.lineThrough : TextDecoration.none),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    change(iii);
                  },
                  icon: Icon(state ? Icons.check : Icons.close),
                  color: state ? Colors.green : Colors.red,
                ),
                IconButton(
                  onPressed: () {
                    delete(iii);
                  },
                  icon: Icon(Icons.delete),
                  color: Color.fromARGB(255, 255, 176, 171),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Color.fromRGBO(209, 224, 224, 0.2),
        ),
      ),
    );
  }
}
