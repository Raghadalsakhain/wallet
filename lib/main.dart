import 'dart:developer';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/utils/service_locator.dart';
import 'package:wallet/features/home/data/datasource/datasource.dart';
import 'package:wallet/features/home/data/model/colortrans.dart';
import 'package:wallet/features/login/presention/ui/login.dart';
import 'package:wallet/core/style/theems/theem.dart';
void main() async {
  stup(); 
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized(); 
  await homescreenApi.categorydelete();
  await homescreenApi.addmoneydelete();  
  await homescreenApi.postcategory(categoryname: 'Food', logo: 'assets/icons/food.svg', amount:49,color: 'FFCEE8E8'); 
  await homescreenApi.postcategory(categoryname: 'Car', logo: 'assets/icons/car.svg', amount:49,color: 'FFEFEDD7'); 
  await homescreenApi.postcategory(categoryname: 'Supermarket', logo: 'assets/icons/supermarket.svg', amount:49,color: 'FFDADDF0');
  MapperContainer.globals.use(const ColorMapper());
  
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

