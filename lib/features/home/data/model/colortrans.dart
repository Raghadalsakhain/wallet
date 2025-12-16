
import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';

class ColorMapper extends SimpleMapper <Color>{
  const ColorMapper();
  @override
  Color decode(dynamic value){
    if(value is int ){
      return Color(value); 
    }
    if(value is String){
      var hex=value.replaceAll('#', ''); 
      if(hex.length==6) hex='FF$hex'; 
      return Color(int.parse(hex,radix: 16)); 
      
    }
    throw FormatException('cannot decode color $value'); 
  }
    @override
    dynamic encode(Color value){
      return '#${value.value.toRadixString(16).padLeft(8,'0')}'; 
    }
  

}