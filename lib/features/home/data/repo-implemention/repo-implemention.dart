//يربط ال model بال data-sources
//هنا الربط بين شكل بيانات المودل 
import 'package:dartz/dartz.dart';
import 'package:wallet/features/home/data/datasource/datasource.dart';
import 'package:wallet/features/home/data/model/category_model.dart';

class Failure{
  final String message; 
  Failure(this.message); 
}

class categoryRepository{
  final homescreenApi api;

  categoryRepository({required this.api}); 
 Future<Either<Failure,List<CategoryModel>>> getcategoryrepo()async{
    try{
   final cate= await api.getcategory();
    return  Right(cate); 
    }catch(e){
      return left(Failure(e.toString())); 
    }
  }

}