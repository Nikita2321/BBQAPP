import 'package:flutter/material.dart';

class SmokeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/smoke.png',  
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}