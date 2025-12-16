

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wallet/features/home/data/model/category_model.dart';
import 'package:wallet/main.dart';

class homescreenApi{
  //اي خدمة خارجية استخدمه API
// layer للصفحة هذي اي بيانات او شي ابي اجيبه 
 static Dio dio=Dio(); 
 static const baseUrladdmoney= 'https://6935fb08fa8e704dafbf66f3.mockapi.io/api/wallet/addmoney'; 
 static const baseUrlcategory='https://6935fb08fa8e704dafbf66f3.mockapi.io/api/wallet/category'; 
 // get all of things in API 
static Future <void> getaddmony()async {
  final Response res=await dio.get(baseUrladdmoney); 
  log(res.data); 
}

//post NEW ROW
static Future <void> addmoney(double num )async{
  final amount = num; 
  final res = await dio.post(
    baseUrladdmoney,
     data: {
      'username':'raghad', 
      'amountprice':num, 
  }); 
}


// TO delete all row
static Future<List<String>> getid()async{
  final res= await dio.get(baseUrladdmoney);
  List data= res.data; 
return data.map((item)=>item['id'].toString()).toList(); 
}
 static Future <void>addmoneydelete()async{
  final ids= await getid(); 
  for(final id in ids){
    await dio.delete('$baseUrladdmoney/$id'); 
  }
  print('all delete is done'); 
}

// To delete all row in categorymodel 
static Future<List<String>> getcategoryid()async{
  final res= await dio.get(baseUrlcategory); 
  List data=res.data ; 
  return data.map((item)=>item['id'].toString()).toList(); 
}
static Future<void>categorydelete()async{
  final ids=await getcategoryid(); 
  for(final id in ids){
    await dio.delete('$baseUrlcategory/$id'); 
  }
  print('all category delete is done'); 
}

// To sum all row num 
static Future <double> getsumamount()async{
 final res= await dio.get(baseUrladdmoney); 
 final data= res.data; 
   double sum=0.0;
   if(data is List){
 for(var id in data){
    final value=double.tryParse(id['amountprice'].toString())??0.0; 
    sum+=value; 
}
   }
return sum; 
  }

// To get the category in API as list 
  Future<List<CategoryModel>> getcategory()async{
  final res=await dio.get(baseUrlcategory); 
  final data=res.data as List; 
  return data.map((item)=>CategoryModelMapper.fromMap(item as Map<String,dynamic>)).toList();
}

// to add the category 
static Future<void> postcategory({ String? categoryname, required String logo , double? amount, required String color})async{
final res=await dio.post(baseUrlcategory,data: {'categoryname':categoryname,'logo':logo, 'amount':amount, 'categoryColor':color }); 
}

}