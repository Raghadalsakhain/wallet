import 'package:flutter/material.dart';
import 'package:wallet/core/style/color/appcolors.dart';

class DisplayamountWidget extends StatelessWidget {
  const DisplayamountWidget({super.key, required this.amount});
final double amount; 
  @override
  Widget build(BuildContext context) {
    return Text(
      "${amount}",
      style: TextStyle(
        fontSize: 37,
        fontWeight: FontWeight.bold,
        color: Appcolors.blakcolor,
      ),
    );
  }
}