import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet/style/color/appcolors.dart';
import 'package:wallet/widgets/category_widget.dart';

class CategoryModel {
 final String? text;
  final double? price;
  final String icon;
  final Color categoryColor;

  CategoryModel({ this.text,  this.price, required this.icon, required this.categoryColor});
}

final List<CategoryModel> CategorythatAdd=[
  CategoryModel( price: 0, icon:"assets/icons/food.svg" , categoryColor: Appcolors.bluecolor, text: 'Food',),
  CategoryModel( price: 0, icon: 'assets/icons/car.svg', categoryColor:Appcolors.yellowcolor, text: 'Car',),
  CategoryModel( price: 0, icon: 'assets/icons/supermarket.svg', categoryColor: Appcolors.purplecolor, text: 'SuperMarket',),
  CategoryModel( price: 0, icon: 'assets/icons/supermarket.svg', categoryColor:Appcolors.ligthbink , text: 'SuperMarkethhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggggggggggg',),
  CategoryModel( icon: 'assets/icons/SAR.png', categoryColor: Appcolors.basecolor,),
]; 