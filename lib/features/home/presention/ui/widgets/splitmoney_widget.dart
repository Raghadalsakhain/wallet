import 'package:flutter/material.dart';
import 'package:wallet/core/style/color/appcolors.dart';

class SplitmoneyWidget extends StatelessWidget {
  const SplitmoneyWidget({super.key, required this.Value});
  final double Value; 
  @override
  Widget build(BuildContext context) {
    return Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '${Value}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Appcolors.blakcolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
  }
}