import 'package:flutter/material.dart';
import 'package:wallet/core/style/color/appcolors.dart';

class Boutton extends StatelessWidget {
  const Boutton({
    super.key,
    required this.text,
    this.backGroudcolor,
    required this.width,
    this.icon,
    this.bordarColor,
    required this.ouline,
    required this.onPressed,
  });
  final String text;
  final Color? backGroudcolor;
  final double width;
  final IconData? icon;
  final Color? bordarColor;
  final bool ouline;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(color: Appcolors.blakcolor, fontSize: 16)),
        if (icon != null) ...[
          SizedBox(width: 6),
          Icon(icon, color: Colors.black54),
        ],
      ],
    );
    return ouline
        ? OutlinedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(6),
                ),
              ),
              side: WidgetStateProperty.all(
                BorderSide(
                  color: bordarColor ?? const Color.fromARGB(255, 0, 0, 0),
                  width: 0.8,
                ),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Appcolors.blakcolor, fontSize: 16),
                ),
                SizedBox(width: 6),
                Icon(icon, color: Appcolors.blakcolor),
              ],
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: bordarColor ?? Colors.transparent),
              ),
              minimumSize: Size(width, 41),
              backgroundColor: backGroudcolor,
            ),
            child: content,
          );
  }
}
