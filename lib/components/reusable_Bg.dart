import 'package:flutter/material.dart';

class ReusableBg extends StatelessWidget {
  ReusableBg({this.colour, this.cardChild, int elevation});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
              color: Colors.lightGreenAccent.withOpacity(0.3),
              offset: const Offset(-5, 0),
              spreadRadius: 5,
              blurRadius: 5.0),
          BoxShadow(
              color: Colors.green.withOpacity(0.5),
              offset: const Offset(0, 5),
              spreadRadius: 5,
              blurRadius: 2.0)
        ],
      ),
    );
  }
}
