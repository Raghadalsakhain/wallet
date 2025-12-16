part of 'mony_bloc.dart';

@immutable
sealed class MonyEvent {}

class addmony extends MonyEvent{
  final String mony;
  addmony({required this.mony}); 
}

class dividedmony extends MonyEvent{
  final String modesplit;
final String categoryName;

  dividedmony({required this.modesplit, required this.categoryName}); 


 
}
class addMoneyToCategory  extends MonyEvent{
  final String money;

  addMoneyToCategory({required this.money}); 
  
}
class sumcategory extends MonyEvent{
}

class getcategory extends MonyEvent{


}