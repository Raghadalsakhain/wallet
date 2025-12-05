import 'package:flutter/material.dart';

extension Appsize on BuildContext{
double getWidth(){
  return MediaQuery.sizeOf(this).width; 
}
double getHight(){
  return MediaQuery.sizeOf(this).height; 
}
}

