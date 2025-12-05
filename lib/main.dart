import 'package:flutter/material.dart';
import 'package:wallet/screens/homescreen.dart';
import 'package:wallet/screens/login/login.dart';
import 'package:wallet/style/theems/theem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(), 
      theme: AppTheme.basetheme, 
    );
  }
}

