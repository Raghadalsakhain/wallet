import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/utils/service_locator.dart';
import 'package:wallet/features/home/data/datasource/datasource.dart';
import 'package:wallet/features/home/data/model/category_model.dart';
import 'package:wallet/features/home/data/repo-implemention/repo-implemention.dart';

part 'mony_event.dart';
part 'mony_state.dart';

class MonyBloc extends Bloc<MonyEvent, MonyState> {
  TextEditingController addmonycontroller = TextEditingController();
  TextEditingController dividedmonycontroller = TextEditingController();
  // double addmoney = 0.0;
     var total= 0.0; 
     List <CategoryModel>categories=[]; 
     
  final Map<String,List> category={'food':[], 'car':[], 'supermarket':[]}; 
  final Map<String,double> sum={}; 
  double lastadd = 0;
  final repo=categoryRepository(api: getit<homescreenApi>());
  MonyBloc() : super(MonyInitial()) {
    on<addmony>(addmon);
    on<dividedmony>(dividemony);
    on<sumcategory>(sumcate); 
    on<getcategory>(getcategor);
  }

  FutureOr<void> addmon(addmony event, Emitter<MonyState> emit) async{
    await  homescreenApi.addmoney(double.parse(event.mony)??0);
     double newtotal=await homescreenApi.getsumamount();
     total=newtotal; 
     print('the sum =$total'); 
    lastadd=double.parse(event.mony); 
    emit(AddmonySuccess(mony: total));
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

  // category.putIfAbsent(categoryname, ()=>[]).add(moneysub); 
  // sum[categoryname]=category[categoryname]!.fold(0.0, (a,b)=>a+b); 
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

  FutureOr<void> getcategor(getcategory event, Emitter<MonyState> emit)async {
  final res= await repo.getcategoryrepo(); 
  res.fold((Failure){
    print('error:${Failure.message}');
    emit(categoryError(message: Failure.message)); 
    
     }
    ,(data){
    categories=data;
    print('cate length is ${categories.length}'); 
    emit(categorystate(category: categories)); 
  });
   print('the category length is ${categories.length}'); 
   print(categories); 
  }
}

