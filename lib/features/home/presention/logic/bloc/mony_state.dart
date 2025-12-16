part of 'mony_bloc.dart';

@immutable
sealed class MonyState {}

final class MonyInitial extends MonyState {}
class AddmonyLooding extends MonyState{}
class AddmonySuccess extends MonyState{
  final double mony;
  AddmonySuccess({required this.mony}); 
}

class addmonyFailure extends MonyState{
  final String message;
  addmonyFailure(this.message); 
}


class supSuccess  extends MonyState{
  final double? money;

  supSuccess({ this.money}); 
  
}

class supFailure extends MonyState{
  final String message;

  supFailure({required this.message});
  
}
class sumtotal extends MonyState{

}
// class categorystate {
//   final List <CategoryModel> category;
//   final String? error; 
//   final bool loading;

//   categorystate({ this.category=const[],  this.error,  this.loading=false});
//   categorystate copyWith({ 
//    List <CategoryModel>? category,
//    String? error, 
//    bool? loading,}){
//     return categorystate(category: category??this.category, error: error, loading: loading??this.loading);
//    }

// }
class categorystate extends MonyState{
 final  List <CategoryModel> category;

  categorystate({required this.category});
}
class categoryError extends MonyState{
  final String message;

  categoryError({required this.message});
}
