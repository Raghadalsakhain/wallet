import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'mony_event.dart';
part 'mony_state.dart';

class MonyBloc extends Bloc<MonyEvent, MonyState> {
  TextEditingController addmonycontroller = TextEditingController();
  TextEditingController dividedmonycontroller = TextEditingController();
  double addmoney = 0.0;
  // final List food = [];
  // final List car = [];
  // final List supermarket = [];
  final Map<String,List> category={'food':[], 'car':[], 'supermarket':[]}; 
  final Map<String,double> sum={}; 
  double lastadd = 0;
  MonyBloc() : super(MonyInitial()) {
    on<addmony>(addmon);
    on<dividedmony>(dividemony);
    on<sumcategory>(sumcate); 
  }

  FutureOr<void> addmon(addmony event, Emitter<MonyState> emit) {
    final double money;
    if (addmoney == 0.0) {
      addmoney = double.parse(event.mony);
      lastadd=double.parse(event.mony); 
     
    } else {
      addmoney += double.parse(event.mony);
      lastadd=double.parse(event.mony); 
    }
    emit(AddmonySuccess(mony: lastadd));
    addmonycontroller.clear();
  }

  FutureOr<void> dividemony(dividedmony event, Emitter<MonyState> emit) {
      final moneysub = double.tryParse(event.modesplit)??0;
      final categoryname=event.categoryName.toLowerCase(); 
      if(moneysub<=0){
        emit(supFailure(message: 'enter vaild num')); 
   
      }else{
   final newvalue= lastadd-moneysub; 
      if(newvalue<0){
        emit(supFailure(message: 'not en')); 
      }else{
  lastadd=newvalue;
  category.forEach((key, value) {
    if(key==categoryname){
      value.add(moneysub); 
    }
  },);
    emit(supSuccess(money: lastadd)); 
    dividedmonycontroller.clear(); 
      }
      }
  }

  FutureOr<void> sumcate(sumcategory event, Emitter<MonyState> emit) {
    category.forEach((Key,value){
      sum[Key]=value.fold(0.0, (a,b)=>a+b); 
    }); 
    print(sum); 
    emit(sumtotal()); 
  }
}
