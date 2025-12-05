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
