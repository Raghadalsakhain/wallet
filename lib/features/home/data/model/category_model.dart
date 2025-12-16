import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part 'category_model.mapper.dart';
@MappableClass()
class CategoryModel with  CategoryModelMappable{
 
  final String user_id; 
  final String categoryname; 
  final double? amount;
  final String logo;
  final Color categoryColor;

  CategoryModel({required this.user_id, required this.categoryname, required this.amount, required this.logo, required this.categoryColor});

  // factory CategoryModel.fromjson(Map<String,dynamic> json){
  //   return CategoryModel(
  //     user_id: json['user_id'],
  //     categoryname: json['categoryname'],
  //     amount: (json['amount']??0).toDouble(), 
  //     logo: json['logo'],
  //     categoryColor: _hexcategory(json['categoryColor'])); 
  // }
  // static Color _hexcategory (String hex){
  //   hex=hex.replaceAll('#', ''); 
  //   if(hex.length ==6){
  //     hex ='FF$hex';
  //   }
  //   return Color(int.parse(hex,radix: 16)); 
  //  }
}

